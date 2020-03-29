import time

from ....keys import alphabet

old_line, old_col = 0, 0


def set_extend(*commands):
    def set_inner(_):
        global extendCommands
        extendCommands = commands

    return set_inner


# noinspection PyMethodParameters,PyMethodMayBeStatic

# def set_to_here(*commands):
#     global toHereCommands, old_line, old_col
#     old_line, old_col = get_idea_location()
#     toHereCommands = commands


# def to_here(m):
#     global toHereCommands
#     for cmd in toHereCommands:
#         cmd(m)
#     toHereCommands = []


#
# def idea(cmd, drop=1, zero_okay=False):
#     def handler(m):
#         # noinspection PyProtectedMember
#         line = insert(phrase)_to_number(m._words[drop:])
#         # print(cmd.format(line))
#         if int(line) == 0 and not zero_okay:
#             print("Not sending, arg was 0")
#             return
#
#         send_idea_command(cmd.format(line))
#         global extendCommands
#         extendCommands = []
#
#     return handler


# XXX Placeholder until I add an RPC template command to the backend
# def start_template(key):
#     send_idea_command("action InsertLiveTemplate")
#     time.sleep(0.3)
#     Str(key + "\n")(None)
#     time.sleep(0.2)
#     key("enter")

# XXX
# def idea_psi_and_snippet():
#     def handler(m):
#         path = m["jetbrains.path"][0]
#         default_index = PSI_PATHS[path]["_"]
#         how_to_add = PSI_PATHS[path].get("+", None)
#         if how_to_add is None:
#             return
#         if PSI_PATHS[path].get(extension, None) is None:
#             # Probably won't do the right thing with fallback path.
#             return
#         prefix, template = how_to_add
#         try:
#             default_index = utils.ordinal_indexes[m["jetbrains.ordinal"][0]]
#         except KeyError:
#             pass
#         # print(cmd.format(line))
#         index = default_index
#         cmd = "end"
#         if index == 0:
#             index = -1
#         if index != "next":
#             # The "next" motion generally means we should add at point.
#             send_psi(path, cmd, index)
#         if prefix:
#             key(prefix)(None)
#             time.sleep(0.1)
#         if template:
#             start_template(template)
#         try:
#             # noinspection PyProtectedMember
#             if m.phrase[0]._words:
#                 time.sleep(0.1)
#                 formatted_text(CAMELCASE)(m)
#         except AttributeError:
#             pass
#
#         global extendCommands
#         extendCommands = []
#
#     return handler
#
#
# def idea_range(cmd, drop=1):
#     def handler(m):
#         # noinspection PyProtectedMember
#         start, end = insert(phrase)_to_range(m._words[drop:])
#         # print(cmd.format(start, end))
#         send_idea_command(cmd.format(start, end))
#         global extendCommands
#         extendCommands = []
#
#     return handler
#


def idea(*args, **kwargs): pass


def insert(*args, **kwargs): pass


def extend_action(*args, **kwargs): pass


def key(*args, **kwargs): pass


phrase = ""
keymap = {}

# Finding action names:
# https://github.com/JetBrains/intellij-community/blob/master/platform/platform-resources-en/src/messages/ActionsBundle.properties
# Setting a hotkey or abbrev, then pulling it out of the xml files.

# group = ContextGroup("jetbrains")
# ctx = Context("jetbrains", func=is_real_jetbrains_editor)  # , group=group)
keymap.update(
    {
        # Misc verbs
        "complete": [idea("action CodeCompletion")],
        "perfect": [
            idea("action CodeCompletion", "action CodeCompletion")
        ],  # perfect == extra complete
        "smart": [idea("action SmartTypeCompletion")],
        # Variants which take text?  Replaced mostly with "call" formatter.
        # "complete <phrase> [over]": [idea("action CodeCompletion"), text],
        # "smart <phrase> [over]": [idea("action SmartTypeCompletion"), text],
        "finish": idea("action EditorCompleteStatement"),
        "done": idea("action EditorCompleteStatement"),
        "toggle tools": idea("action HideAllWindows"),
        "drag up": idea("action MoveLineUp"),
        "drag down": idea("action MoveLineDown"),
        "clone this": idea("action EditorDuplicate"),
        "clone line": idea("action EditorDuplicate"),
        f"clone line <number>": [idea("clone <number>")],
        # f"grab [<number>]": [grab_identifier, set_extend()],
        # "(synchronizing | synchronize)": idea("action Synchronize"),
        "(action | please)": idea("action GotoAction"),
        "(action | please) <phrase>++ [over]": [
            idea("action GotoAction"),
            insert(phrase),
        ],
        f"extend [<number>]": extend_action,
        # Refactoring
        "refactor": idea("action Refactorings.QuickListPopupAction"),
        "refactor <phrase> [over]": [
            idea("action Refactorings.QuickListPopupAction"),
            insert(phrase),
        ],
        "extract variable": idea("action IntroduceVariable"),
        "extract field": idea("action IntroduceField"),
        "extract constant": idea("action IntroduceConstant"),
        "extract parameter": idea("action IntroduceParameter"),
        "extract interface": idea("action ExtractInterface"),
        "extract method": idea("action ExtractMethod"),
        "refactor in line": idea("action Inline"),
        "refactor move": idea("action Move"),
        "refactor rename": idea("action RenameElement"),
        "rename file": idea("action RenameFile"),
        # Quick Fix / Intentions
        "fix this <phrase> [over]": [
            idea("action ShowIntentionActions"),
            insert(phrase),
        ],
        "fix (format | formatting)": idea("action ReformatCode"),
        "fix imports": idea("action OptimizeImports"),
        # Go: move the caret
        "(go declaration | follow)": idea("action GotoDeclaration"),
        "go implementation": idea("action GotoImplementation"),
        "go usage": idea("action FindUsages"),
        "go type": idea("action GotoTypeDeclaration"),
        "go test": idea("action GotoTest"),
        "go back": idea("action Back"),
        "go forward": idea("action Forward"),
        # Special Selects
        "select less": idea("action EditorUnSelectWord"),
        "select more": idea("action EditorSelectWord"),
        "select this": idea("action EditorSelectWord"),
        "multi-select up": idea("action EditorCloneCaretAbove"),
        "multi-select down": idea("action EditorCloneCaretBelow"),
        "multi-select fewer": idea("action UnselectPreviousOccurrence"),
        "multi-select more": idea("action SelectNextOccurrence"),
        "multi-select all": idea("action SelectAllOccurrences"),
        # Search
        "search (everywhere | all)": idea("action SearchEverywhere"),
        "search (everywhere | all) <phrase> [over]": [
            idea("action SearchEverywhere"),
            insert(phrase),
            set_extend(),
        ],
        "search symbol": idea("action GotoSymbol"),
        "search symbol <phrase>": [
            idea("action GotoSymbol"),
            insert(phrase),
            key("enter"),
        ],
        "search class": idea("action GotoClass"),
        "search class <phrase>": [
            idea("action GotoClass"),
            insert(phrase),
            key("enter"),
        ],
        "search file": idea("action GotoFile"),
        "search file <phrase>": [
            idea("action GotoFile"),
            insert(phrase),
            key("enter"),
        ],
        "recent": [idea("action RecentFiles"), set_extend()],
        "recent <phrase> [over]": [
            idea("action RecentFiles"),
            insert(phrase),
            set_extend(),
        ],
        "search": idea("action Find"),
        "search for <phrase> [over]": [
            idea("action Find"),
            insert(phrase),
            set_extend("action FindNext"),
        ],
        # "go next search": idea("action FindNext"),
        # "go last search": idea("action FindPrevious"),
        "go next result": idea("action FindNext"),
        "go last result": idea("action FindPrevious"),
        "search in path": idea("action FindInPath"),
        "search in path <phrase> [over]": [idea("action FindInPath"), insert(phrase)],
        "search this": idea("action FindWordAtCaret"),
        # Templates: surround, generate, template.
        # "surround [this] with": idea("action SurroundWith"),
        "surround [this] with <phrase> [over]": [
            idea("action SurroundWith"),
            insert(phrase),
        ],
        # Making these longer to reduce collisions with real code dictation.
        "insert generated <phrase> [over]": [idea("action Generate"), insert(phrase)],
        "insert template <phrase> [over]": [
            idea("action InsertLiveTemplate"),
            insert(phrase),
        ],
        "create template": idea("action SaveAsTemplate"),
        # Lines / Selections
        "clear line contents": idea(
            "action EditorLineEnd", "action EditorDeleteToLineStart"
        ),
        # XXX Replaced with way left/right
        # "clear line end": idea("action EditorDeleteToLineEnd"),
        # "clear line start": idea("action EditorDeleteToLineStart"),
        # Run!
        "run menu": idea("action ChooseRunConfiguration"),
        "run again": idea("action Run"),
        # Recording
        "toggle recording": idea("action StartStopMacroRecording"),
        "change (recording | recordings)": idea("action EditMacros"),
        "play recording": idea("action PlaybackLastMacro"),
        "play recording <phrase> [over]": [
            idea("action PlaySavedMacrosAction"),
            insert(phrase),
            key("enter"),
        ],
        # Talon Marks
        # "pushed": push_loc,
        # "popped": pop_loc,
        # "swapped": swap_loc,
        # Marks
        "go mark": idea("action ShowBookmarks"),
        "toggle mark": idea("action ToggleBookmark"),
        "toggle mark here": [
            # lambda m: delayed_click(m, from_end=True),
            idea("action ToggleBookmark"),
        ],
        "go next mark": idea("action GotoNextBookmark"),
        "go last mark": idea("action GotoPreviousBookmark"),
        f"toggle mark (0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9)": idea(
            "action ToggleBookmark{}", drop=1, zero_okay=True
        ),
        f"go mark (0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9)": idea(
            "action GotoBookmark<number>", zero_okay=True
        ),
        # Folding
        "expand deep": idea("action ExpandRegionRecursively"),
        "expand all": idea("action ExpandAllRegions"),
        "collapse deep": idea("action CollapseRegionRecursively"),
        "collapse all": idea("action CollapseAllRegions"),
        # Splits
        "split right": idea("action MoveTabRight"),
        "split down": idea("action MoveTabDown"),
        "split vertically": idea("action SplitVertically"),
        "split horizontally": idea("action SplitHorizontally"),
        "split flip": idea("action ChangeSplitOrientation"),
        "split window": idea("action EditSourceInNewWindow"),
        "clear split": idea("action Unsplit"),
        "clear all splits": idea("action UnsplitAll"),
        "go next split": idea("action NextSplitter"),
        "go last split": idea("action LastSplitter"),
        # miscellaneous
        # XXX These might be better than the structural ones, depending on language.
        # "go next (method | function)": idea("action MethodDown"),
        # "go last (method | function)": idea("action MethodUp"),
        # Clipboard
        # "clippings": idea("action PasteMultiple"),  # XXX Might be a long-lived action.  Replaced with Alfred.
        "copy path": idea("action CopyPaths"),
        "copy reference": idea("action CopyReference"),
        "copy pretty": idea("action CopyAsRichText"),
        # File Creation
        "create sibling": idea("action NewElementSamePlace"),
        "create sibling <phrase> [over]": [
            idea("action NewElementSamePlace"),
            insert(phrase),
        ],
        "create file": idea("action NewElement"),
        "create file <phrase> [over]": [idea("action NewElement"), insert(phrase)],
        # Task Management
        "go task": [idea("action tasks.goto")],
        "go browser task": [idea("action tasks.open.in.browser")],
        "switch task": [idea("action tasks.switch")],
        "clear task": [idea("action tasks.close")],
        "fix task settings": [idea("action tasks.configure.servers")],
        # Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
        "jet pull": idea("action Vcs.UpdateProject"),
        "jet commit": idea("action CheckinProject"),
        "jet push": idea("action CheckinProject"),
        "jet log": idea("action Vcs.ShowTabbedFileHistory"),
        "jet browse": idea("action Github.Open.In.Browser"),
        "jet (gets | gist)": idea("action Github.Create.Gist"),
        "jet (pull request | request)": idea("action Github.Create.Pull.Request"),
        "jet (view | show | list) (requests | request)": idea(
            "action Github.View.Pull.Request"
        ),
        "jet (annotate | blame)": idea("action Annotate"),
        "jet menu": idea("action Vcs.QuickListPopupAction"),
        # Tool windows:
        # Toggling various tool windows
        "(toggle | focus) project": idea("action ActivateProjectToolWindow"),
        "(toggle | focus) find": idea("action ActivateFindToolWindow"),
        "(toggle | focus) run": idea("action ActivateRunToolWindow"),
        "(toggle | focus) debug": idea("action ActivateDebugToolWindow"),
        "(toggle | focus) events": idea("action ActivateEventLogToolWindow"),
        "(toggle | focus) terminal": idea("action ActivateTerminalToolWindow"),
        "(toggle | focus) jet": idea("action ActivateVersionControlToolWindow"),
        "(toggle | focus) structure": idea("action ActivateStructureToolWindow"),
        "(toggle | focus) database": idea("action ActivateDatabaseToolWindow"),
        "(toggle | focus) database changes": idea("action ActivateDatabaseChangesToolWindow"),
        "(toggle | focus) make": idea("action ActivatemakeToolWindow"),
        "(toggle | focus) to do": idea("action ActivateTODOToolWindow"),
        "(toggle | focus) docker": idea("action ActivateDockerToolWindow"),
        "(toggle | focus) favorites": idea("action ActivateFavoritesToolWindow"),
        "(toggle | focus) last": idea("action JumpToLastWindow"),
        # Pin/dock/float
        "toggle pinned": idea("action TogglePinnedMode"),
        "toggle docked": idea("action ToggleDockMode"),
        "toggle floating": idea("action ToggleFloatingMode"),
        "toggle windowed": idea("action ToggleWindowedMode"),
        "toggle split": idea("action ToggleSideMode"),
        # Settings, not windows
        "toggle tool buttons": idea("action ViewToolButtons"),
        "toggle toolbar": idea("action ViewToolBar"),
        "toggle status [bar]": idea("action ViewStatusBar"),
        "toggle navigation [bar]": idea("action ViewNavigationBar"),
        # Active editor settings
        "toggle power save": idea("action TogglePowerSave"),
        "toggle whitespace": idea("action EditorToggleShowWhitespaces"),
        "toggle indents": idea("action EditorToggleShowIndentLines"),
        "toggle line numbers": idea("action EditorToggleShowLineNumbers"),
        "toggle bread crumbs": idea("action EditorToggleShowBreadcrumbs"),
        "toggle gutter icons": idea("action EditorToggleShowGutterIcons"),
        "toggle wrap": idea("action EditorToggleUseSoftWraps"),
        "toggle parameters": idea("action ToggleInlineHintsAction"),
        # Toggleable views
        "toggle fullscreen": idea("action ToggleFullScreen"),
        "toggle distraction [free mode]": idea("action ToggleDistractionFreeMode"),
        "toggle presentation [mode]": idea("action TogglePresentationMode"),
        # Tabs
        "go first tab": idea("action GoToTab1"),
        "go second tab": idea("action GoToTab2"),
        "go third tab": idea("action GoToTab3"),
        "go fourth tab": idea("action GoToTab4"),
        "go fifth tab": idea("action GoToTab5"),
        "go sixth tab": idea("action GoToTab6"),
        "go seventh tab": idea("action GoToTab7"),
        "go eighth tab": idea("action GoToTab8"),
        "go ninth tab": idea("action GoToTab9"),
        "go next tab": idea("action NextTab"),
        "go last tab": idea("action PreviousTab"),
        "go final tab": idea("action GoToLastTab"),
        "clear tab": idea("action CloseActiveTab"),
        # Quick popups
        "change scheme": idea("action QuickChangeScheme"),
        "toggle (doc | documentation)": idea("action QuickJavaDoc"),  # Always javadoc
        "pop (doc | documentation)": idea("action QuickJavaDoc"),  # Always javadoc
        "(pop deaf | toggle definition)": idea("action QuickImplementations"),
        "pop type": idea("action ExpressionTypeInfo"),
        "pop parameters": idea("action ParameterInfo"),
        # Breakpoints / debugging
        "go breakpoints": idea("action ViewBreakpoints"),
        "toggle [line] breakpoint": idea("action ToggleLineBreakpoint"),
        "toggle method breakpoint": idea("action ToggleMethodBreakpoint"),
        "step over": idea("action StepOver"),
        "step out": idea("action StepOut"),
        "step into": idea("action StepInto"),
        "step smart": idea("action SmartStepInto"),
        "step to line": idea("action RunToCursor"),
        "resume program": idea("action Resume"),
        # Grow / Shrink
        "(grow | shrink) window right": idea("action ResizeToolWindowRight"),
        "(grow | shrink) window left": idea("action ResizeToolWindowLeft"),
        "(grow | shrink) window up": idea("action ResizeToolWindowUp"),
        "(grow | shrink) window down": idea("action ResizeToolWindowDown"),
        # Dash Searching https://github.com/gdelmas/IntelliJDashPlugin
        "go [smart] dash": idea("action SmartSearchAction"),
        "go all dash": idea("action SearchAction"),
        # Most of the edition, selection, etc. commands now come
        # from build_text_action_keymap.  Any edge cases go here.
        # moving
        # "go phrase left": [utils.select_last_insert, idea("action EditorLeft")],
        # # clipboard
        # "cut this": idea("action EditorCut"),
        # "copy this": idea("action EditorCopy"),
        # "paste [here]": idea("action EditorPaste"),
        # From here commands
        # "select from here": lambda m: set_to_here(
        #     lambda _: delayed_click(m, from_end=True),
        #     lambda m2: delayed_click(m2, from_end=True, mods=["shift"]),
        # ),
        # "clear from here": [
        #     (
        #         lambda m: set_to_here(
        #             lambda _: delayed_click(m, from_end=True),
        #             lambda m2: delayed_click(m2, from_end=True, mods=["shift"]),
        #             lambda _: time.sleep(0.2),
        #             idea("action EditorBackSpace"),
        #         )
        #     )
        # ],
        # "comment from here": lambda m: set_to_here(
        #     lambda _: delayed_click(m, from_end=True),
        #     lambda m2: delayed_click(m2, from_end=True, mods=["shift"]),
        #     lambda _: time.sleep(0.2),
        #     idea("action CommentByLineComment"),
        # ),
        # "copy from here": lambda m: set_to_here(
        #     lambda _: delayed_click(m, from_end=True),
        #     lambda m2: delayed_click(m2, from_end=True, mods=["shift"]),
        #     lambda _: time.sleep(0.2),
        #     idea("action EditorCopy"),
        # ),
        # "cut from here": lambda m: set_to_here(
        #     lambda _: delayed_click(m, from_end=True),
        #     lambda m2: delayed_click(m2, from_end=True, mods=["shift"]),
        #     lambda _: time.sleep(0.2),
        #     idea("action EditorCut"),
        # ),
        # "to here": to_here,
        # # Structure
        # "create {jetbrains.path} [<phrase>] [over]": [
        #     push_loc,
        #     idea_psi_and_snippet(),
        # ],
    }
)

# ctx.keymap(keymap)
# ctx.set_list("alphabet", alphabet.keys())
# ctx.set_list("ordinal", utils.ordinal_indexes.keys())
# ctx.set_list("path", PSI_PATHS.keys())

# group.load()
