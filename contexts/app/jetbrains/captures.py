from talon import Module

from .scope import Actions
from .psi import PSI_PATHS

from ....wrapper import as_rule

mod = Module()


def idea(cmd):
    def _action():
        Actions.jb_cmds()


select_verbs = {
    "select": "",
    "copy": "action EditorCopy",
    "cut": "action EditorCut",
    "clear": "action EditorBackSpace",
    "comment": "action CommentByLineComment",
    "replace": "action EditorPaste",
    "expand": "action ExpandRegion",
    "collapse": "action CollapseRegion",
    # "phones": [phones_selection],
    "refactor": "action Refactorings.QuickListPopupAction",
    "rename": "action RenameElement",
    "indent": "action EditorIndentLineOrSelection",
    "unindent": "action EditorUnindentSelection",
}


@mod.capture(rule=as_rule(select_verbs))
def jb_selection(m: list) -> str:
    """Returns a named modifier"""
    return select_verbs[" ".join(m)]


movement_verbs = {
    "go": "",
    "fix": "action ShowIntentionActions",
    "paste": "action EditorPaste",
}


@mod.capture(rule=as_rule(movement_verbs))
def jb_movement(m: list) -> str:
    """Returns a named modifier"""
    return movement_verbs[" ".join(m)]


@mod.capture(rule=as_rule(PSI_PATHS))
def jb_psi(m: list) -> dict:
    """Returns a named PSI path definition"""
    return PSI_PATHS[" ".join(m)]