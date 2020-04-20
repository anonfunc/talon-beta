# noinspection PyUnresolvedReferences
import os

import requests

# noinspection PyUnresolvedReferences
from talon import scope, ui, Module

from .psi import PSI_PATHS

mod = Module()
current_jetbrains = ''

# Each IDE gets its own port, as otherwise you wouldn't be able
# to run two at the same time and switch between them.
# Note that MPS and IntelliJ ultimate will conflict...
port_mapping = {
    "com.jetbrains.intellij": 8653,
    "com.jetbrains.intellij-EAP": 8653,
    "com.jetbrains.intellij.ce": 8654,
    "com.jetbrains.AppCode": 8655,
    "com.jetbrains.CLion": 8657,
    "com.jetbrains.datagrip": 8664,
    "com.jetbrains.goland": 8659,
    "com.jetbrains.goland-EAP": 8659,
    "com.jetbrains.PhpStorm": 8662,
    "com.jetbrains.pycharm": 8658,
    "com.jetbrains.rider": 8660,
    "com.jetbrains.rubymine": 8661,
    "com.jetbrains.WebStorm": 8663,
    "com.google.android.studio": 8652,
}


@mod.scope
def jetbrains_scope():
    global current_jetbrains
    return {'jetbrains': current_jetbrains}


def _update_ui_scopes(event, arg):
    global current_jetbrains

    if event in ('win_open', 'win_closed') and arg.app.bundle not in port_mapping.keys():
        return
    elif event in ("app_activate", "app_launch", "app_close") and arg.bundle not in port_mapping.keys():
        return

    if event in ('win_open', 'win_closed'):
        app, window = arg.app, arg
    elif event in ("app_activate", "app_launch", "app_close"):
        app, window = arg, arg.active_window
    else:
        return

    # print(app, window)
    if _is_real_jetbrains_editor(app, window):
        current_jetbrains = app.bundle
        # print(f"Updating jetbrains scope: {current_jetbrains}")
    else:
        current_jetbrains = ""
    jetbrains_scope.update()


def _is_real_jetbrains_editor(app, window) -> bool:
    # print("Context check")
    if app.bundle not in port_mapping:
        return False
    if window is None:
        return False
    # XXX Expose "does editor have focus" as plugin endpoint.
    # XXX Window title empty in full screen.
    title = window.title
    if not title:
        # print(f"Window is Jetbrains product but not an editor: {window}")
        return False

    t = " – " in window.title or "[" in window.title or len(window.title) == 0
    # print(f"{window} {app} {t}")
    return t


ui.register("", _update_ui_scopes)


def _send_jetbrains(bundle: str, cmd: str) -> str:
    print("Sending {}".format(cmd))

    port = port_mapping.get(bundle, None)
    nonce = _get_nonce(port)
    if port and nonce:
        # noinspection PyUnresolvedReferences
        response = requests.get(
            "http://localhost:{}/{}/{}".format(port, nonce, cmd), timeout=(0.05, 3.05)
        )
        response.raise_for_status()
        return response.text


def _get_nonce(port):
    try:
        with open(os.path.join(os.path.expanduser("~"), ".vcidea_" + str(port)), "r") as fh:
            return fh.read()

    except IOError:
        return None


extendCommands = []
old_line, old_col = 0, 0
location_stack = []


def _set_extend(*commands):
    def set_inner(_):
        global extendCommands
        extendCommands = commands

    return set_inner


# XXX
# def push_loc(_):
#     line, col = get_idea_location()
#     global location_stack
#     location_stack.append((line, col))
#
#
# def pop_loc(_):
#     global location_stack
#     if not location_stack:
#         return
#     line, col = location_stack.pop()
#     send_idea_command("goto {} {}".format(line, col))
#
#
# def swap_loc(_):
#     global location_stack
#     if not location_stack:
#         return
#     line1, col1 = get_idea_location()
#     line2, col2 = location_stack.pop()
#     send_idea_command("goto {} {}".format(line2, col2))
#     location_stack.append((line1, col1))

# noinspection PyMethodParameters,PyMethodMayBeStatic
@mod.action_class
class Actions:
    def current_jetbrains() -> str:
        """Get current jetbrains bundle."""
        return scope.get("user.jetbrains")

    #
    # def jb_send_cmd(cmd: str) -> str:
    #     """Send a raw idea command"""
    #     # print("Sending {}".format(cmd))
    #     bundle = scope.get("user.jetbrains")
    #     if not bundle:
    #         return ""
    #     return _send_jetbrains(bundle, cmd)

    def jb_extend(number: str):
        """Perform the current extension action"""
        global extendCommands
        bundle = scope.get("user.jetbrains")
        if not bundle:
            return
        # noinspection PyProtectedMember
        count = max(int(number), 1)
        for _ in range(count):
            for cmd in extendCommands:
                if cmd:
                    _send_jetbrains(bundle, cmd)

    def jb_location() -> list:
        """ Get current line and column """
        bundle = scope.get("user.jetbrains")
        if not bundle:
            return []
        return _send_jetbrains(bundle, "location").split()

    def jb_set_extend(commands: str):
        """Send a list of commands, split on commas"""
        global extendCommands

        commands = commands.split(",")
        extendCommands = commands

    def jb_cmd(commands: str):
        """Send a list of commands, split on commas"""
        global extendCommands
        # print(f"commands: {commands}")
        bundle = scope.get("user.jetbrains")
        if not bundle:
            return
        commands = commands.split(",")
        extendCommands = commands
        for cmd in commands:
            if cmd:
                _send_jetbrains(bundle, cmd)

    def jb_psi(psi_path: dict, cmd: str, index: str):
        """Do a PSI based movement or selection"""
        global extendCommands

        bundle = scope.get("user.jetbrains")
        if not bundle:
            return

        if not index:
            index = psi_path["_"]

        extension = scope.get("user.language")

        resolved_path = psi_path.get(extension, psi_path.get("default", None))
        if resolved_path is None:
            return
        cmd_string = f"psi {cmd} {resolved_path}"
        if "##" in cmd_string:
            cmd_string = cmd_string.replace("##", f"%23{index}")
        else:
            cmd_string = f"{cmd_string}%23{index}"

        _send_jetbrains(bundle, cmd_string)
        extendCommands = []

    def jb_close_search(direction: str, phrase: str):
        """Search in the given direction for phrase"""
        bundle = scope.get("user.jetbrains")
        if not bundle:
            return
        cmd = f"find {direction} {phrase}"
        _send_jetbrains(bundle, cmd)
        global extendCommands
        extendCommands = [cmd]

    def jb_bounded_search(direction: str, start: str, end: str):
        """Search in the given direction for a word starting and ending with letters."""
        bundle = scope.get("user.jetbrains")
        if not bundle:
            return
        search_string = "%5Cb" + r"%5B^-_ .()%5D*?".join(
            start, end
        )  # URL escaped Java regex! '\b' 'A[%-_.()]*?Z"
        cmd = f"find {direction} {search_string}"
        _send_jetbrains(bundle, cmd)
        global extendCommands
        extendCommands = [cmd]
