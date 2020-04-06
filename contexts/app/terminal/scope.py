# noinspection PyUnresolvedReferences
from talon import scope, ui, Module, Context, tap

mod = Module()


# @mod.capture
# def subdir():
#     pass

@mod.action_class
class Action:
    def terminal_update_ctx():
        """Update terminal context"""


def terminal_hotkey(_, e) -> bool:
    """Adds an alt-w to pick up zle selection as well."""
    window = ui.active_window()
    bundle = window.app.bundle
    if bundle != "com.googlecode.iterm2":
        return True
    # if e == "cmd-c" and e.up:
    #     # print("intercept " + str(e))
    #     key("alt-w")(None)
    # elif e == "enter" and e.up:
    #     # print("intercept " + str(e))
    #     cron.after("500ms", lambda: update_ctx(None))
    # return True


tap.register(tap.HOOK | tap.KEY, terminal_hotkey)
