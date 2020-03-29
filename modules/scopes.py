# noinspection PyUnresolvedReferences
from talon import scope, ui, Module

mod = Module()
language = 'unknown'


@mod.scope
def language_scope():
    global language
    return {'language': language}


def _update_ui_scopes(event, arg):
    global language
    if event in ('win_open', 'win_closed') and arg.app.name in ('Amethyst', "osascript"):
        return
    elif event in ("app_activate", "app_launch", "app_close") and arg.name in ('Amethyst', "osascript"):
        return

    extension = ""
    if event in ('win_open', 'win_closed'):
        extension = _extension(arg.app, arg)
    elif event in ("app_activate", "app_launch", "app_close"):
        extension = _extension(arg, arg.active_window)
    if extension:
        print(f"new extension is {extension}")
        language = extension
        language_scope.update()


def _extension(app, win) -> str:
    if win is None:
        return ""
    title = win.title
    if app.bundle == "com.microsoft.VSCode":
        if u"\u2014" in title:
            filename = title.split(u" \u2014 ", 1)[0]  # Unicode em dash!
        elif "-" in title:
            filename = title.split(u" - ", 1)[0]
    elif app.bundle == "com.apple.Terminal":
        parts = title.split(" \u2014 ")
        if len(parts) >= 2 and parts[1].startswith(("vi ", "vim ")):
            filename = parts[1].split(" ", 1)[1]
        else:
            return ""
    elif str(app.bundle).startswith("com.jetbrains."):
        filename = title.split(" - ")[-1]
        filename = filename.split(" [")[0]
    elif win.doc:
        filename = win.doc
    else:
        return ""
    filename = filename.strip()
    if "." in filename:
        return filename.split(".")[-1]
    return ""


ui.register("", _update_ui_scopes)


# noinspection PyMethodParameters
@mod.action_class
class Actions:
    def set_language(lang: str):
        """Set lang of language_scope.  (Not the real name of the language, just the file extension.)"""
        global language
        language = lang
        language_scope.update()

    def current_language() -> str:
        """Get current language."""
        print(f"current language is {language}")
        return scope.get("user.language")
