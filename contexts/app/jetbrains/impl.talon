user.jetbrains: /./
-

### Commands ###

complete: user.jb_cmd("action CodeCompletion")
perfect: user.jb_cmd("action CodeCompletion,action CodeCompletion")
smart: user.jb_cmd("action SmartTypeCompletion")
finish: user.jb_cmd("action EditorCompleteStatement")
done: user.jb_cmd("action EditorCompleteStatement")
(action | please): user.jb_cmd("action GotoAction")
(action | please) <phrase> [over]:
        user.jb_cmd("action GotoAction")
        sleep(100ms)
        insert(phrase)

toggle tools: user.jb_cmd("action HideAllWindows")
drag up: user.jb_cmd("action MoveLineUp")
drag down: user.jb_cmd("action MoveLineDown")
clone this: user.jb_cmd("action EditorDuplicate")
# clone line: user.jb_cmd("action EditorDuplicate")
action(edit.line_clone): user.jb_cmd("action EditorDuplicate")
clone line <number>: user.jb_cmd("clone <number>")
# grab [<number>]: grab_identifier, set_extend()
# "(synchronizing | synchronize): user.jb_cmd("action Synchronize")
(action | please): user.jb_cmd("action GotoAction")
(action | please) <phrase>++ [over]: 
    user.jb_cmd("action GotoAction")
    insert(phrase)
# XXX extend [<number>]: extend_action
# Refactoring
refactor: user.jb_cmd("action Refactorings.QuickListPopupAction")
refactor <phrase> [over]: 
    user.jb_cmd("action Refactorings.QuickListPopupAction")
    insert(phrase)

extract variable: user.jb_cmd("action IntroduceVariable")
extract field: user.jb_cmd("action IntroduceField")
extract constant: user.jb_cmd("action IntroduceConstant")
extract parameter: user.jb_cmd("action IntroduceParameter")
extract interface: user.jb_cmd("action ExtractInterface")
extract method: user.jb_cmd("action ExtractMethod")
refactor in line: user.jb_cmd("action Inline")
refactor move: user.jb_cmd("action Move")
refactor rename: user.jb_cmd("action RenameElement")
rename file: user.jb_cmd("action RenameFile")
# Quick Fix / Intentions
fix this <phrase> [over]: 
    user.jb_cmd("action ShowIntentionActions")
    insert(phrase)

fix (format | formatting): user.jb_cmd("action ReformatCode")
fix imports: user.jb_cmd("action OptimizeImports")
# Go: move the caret
(go declaration | follow): user.jb_cmd("action GotoDeclaration")
go implementation: user.jb_cmd("action GotoImplementation")
go usage: user.jb_cmd("action FindUsages")
go type: user.jb_cmd("action GotoTypeDeclaration")
go test: user.jb_cmd("action GotoTest")
go back: user.jb_cmd("action Back")
go forward: user.jb_cmd("action Forward")
# Special Selects
select less: user.jb_cmd("action EditorUnSelectWord")
select more: user.jb_cmd("action EditorSelectWord")
select this: user.jb_cmd("action EditorSelectWord")
multi-select up: user.jb_cmd("action EditorCloneCaretAbove")
multi-select down: user.jb_cmd("action EditorCloneCaretBelow")
multi-select fewer: user.jb_cmd("action UnselectPreviousOccurrence")
multi-select more: user.jb_cmd("action SelectNextOccurrence")
multi-select all: user.jb_cmd("action SelectAllOccurrences")
# Search
search (everywhere | all): user.jb_cmd("action SearchEverywhere")
search (everywhere | all) <phrase> [over]: 
    user.jb_cmd("action SearchEverywhere")
    insert(phrase)
    user.jb_set_extend("")

search symbol: user.jb_cmd("action GotoSymbol")
search symbol <phrase>: 
    user.jb_cmd("action GotoSymbol")
    insert(phrase)
    key("enter")

search class: user.jb_cmd("action GotoClass")
search class <phrase>: 
    user.jb_cmd("action GotoClass")
    insert(phrase)
    key("enter")

search file: user.jb_cmd("action GotoFile")
search file <phrase>: 
    user.jb_cmd("action GotoFile")
    insert(phrase)
    key("enter")

recent:
    user.jb_cmd("action RecentFiles")
    user.jb_set_extend("")
recent <phrase> [over]: 
    user.jb_cmd("action RecentFiles")
    insert(phrase)
    user.jb_set_extend("")

search: user.jb_cmd("action Find")
search for <phrase> [over]: 
    user.jb_cmd("action Find")
    insert(phrase)
    user.jb_set_extend("action FindNext")

# "go next search: user.jb_cmd("action FindNext")
# "go last search: user.jb_cmd("action FindPrevious")
go next result: user.jb_cmd("action FindNext")
go last result: user.jb_cmd("action FindPrevious")
search in path: user.jb_cmd("action FindInPath")
search in path <phrase> [over]:
    user.jb_cmd("action FindInPath")
    insert(phrase)

search this: user.jb_cmd("action FindWordAtCaret")
# Templates: surround, generate, template.
# "surround [this] with: user.jb_cmd("action SurroundWith")
surround [this] with <phrase> [over]: 
    user.jb_cmd("action SurroundWith")
    insert(phrase)

# Making these longer to reduce collisions with real code dictation.
insert generated <phrase> [over]:
    user.jb_cmd("action Generate")
    insert(phrase)
insert template <phrase> [over]: 
    user.jb_cmd("action InsertLiveTemplate")
    insert(phrase)

create template: user.jb_cmd("action SaveAsTemplate")
# Lines / Selections
clear line contents: user.jb_cmd("action EditorLineEnd,action EditorDeleteToLineStart")
# XXX Replaced with way left/right
# "clear line end: user.jb_cmd("action EditorDeleteToLineEnd")
# "clear line start: user.jb_cmd("action EditorDeleteToLineStart")
# Run!
run menu: user.jb_cmd("action ChooseRunConfiguration")
run again: user.jb_cmd("action Run")
# Recording
toggle recording: user.jb_cmd("action StartStopMacroRecording")
change (recording | recordings): user.jb_cmd("action EditMacros")
play recording: user.jb_cmd("action PlaybackLastMacro")
play recording <phrase> [over]: 
    user.jb_cmd("action PlaySavedMacrosAction")
    insert(phrase)
    key("enter")

# Talon Marks
# "pushed: push_loc
# "popped: pop_loc
# "swapped: swap_loc
# Marks
go mark: user.jb_cmd("action ShowBookmarks")
toggle mark: user.jb_cmd("action ToggleBookmark")
toggle mark here: 
    # lambda m: delayed_click(m, from_end=True)
    user.jb_cmd("action ToggleBookmark")

go next mark: user.jb_cmd("action GotoNextBookmark")
go last mark: user.jb_cmd("action GotoPreviousBookmark")
toggle mark <digits>: user.jb_cmd("action ToggleBookmark<digits>")
go mark <digits>: user.jb_cmd("action GotoBookmark{digits}")
# Folding
expand deep: user.jb_cmd("action ExpandRegionRecursively")
expand all: user.jb_cmd("action ExpandAllRegions")
collapse deep: user.jb_cmd("action CollapseRegionRecursively")
collapse all: user.jb_cmd("action CollapseAllRegions")

# Splits
split right: user.jb_cmd("action MoveTabRight")
split down: user.jb_cmd("action MoveTabDown")
split vertically: user.jb_cmd("action SplitVertically")
split horizontally: user.jb_cmd("action SplitHorizontally")
split flip: user.jb_cmd("action ChangeSplitOrientation")
split window: user.jb_cmd("action EditSourceInNewWindow")
clear split: user.jb_cmd("action Unsplit")
clear all splits: user.jb_cmd("action UnsplitAll")
go next split: user.jb_cmd("action NextSplitter")
go last split: user.jb_cmd("action LastSplitter")

# miscellaneous

# XXX These might be better than the structural ones, depending on language.
# "go next (method | function): user.jb_cmd("action MethodDown")
# "go last (method | function): user.jb_cmd("action MethodUp")

# Clipboard
# "clippings: user.jb_cmd("action PasteMultiple"),  # XXX Might be a long-lived action.  Replaced with Alfred.
copy path: user.jb_cmd("action CopyPaths")
copy reference: user.jb_cmd("action CopyReference")
copy pretty: user.jb_cmd("action CopyAsRichText")
# File Creation
create sibling: user.jb_cmd("action NewElementSamePlace")
create sibling <phrase> [over]: 
    user.jb_cmd("action NewElementSamePlace")
    insert(phrase)

create file: user.jb_cmd("action NewElement")
create file <phrase> [over]:
    user.jb_cmd("action NewElement")
    insert(phrase)

# Task Management
go task: user.jb_cmd("action tasks.goto")
go browser task: user.jb_cmd("action tasks.open.in.browser")
switch task: user.jb_cmd("action tasks.switch")
clear task: user.jb_cmd("action tasks.close")
fix task settings: user.jb_cmd("action tasks.configure.servers")
# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
jet pull: user.jb_cmd("action Vcs.UpdateProject")
jet commit: user.jb_cmd("action CheckinProject")
jet push: user.jb_cmd("action CheckinProject")
jet log: user.jb_cmd("action Vcs.ShowTabbedFileHistory")
jet browse: user.jb_cmd("action Github.Open.In.Browser")
jet (gets | gist): user.jb_cmd("action Github.Create.Gist")
jet (pull request | request): user.jb_cmd("action Github.Create.Pull.Request")
jet (view | show | list) (requests | request): user.jb_cmd("action Github.View.Pull.Request")
jet (annotate | blame): user.jb_cmd("action Annotate")
jet menu: user.jb_cmd("action Vcs.QuickListPopupAction")
# Tool windows:
# Toggling various tool windows
(toggle | focus) project: user.jb_cmd("action ActivateProjectToolWindow")
(toggle | focus) find: user.jb_cmd("action ActivateFindToolWindow")
(toggle | focus) run: user.jb_cmd("action ActivateRunToolWindow")
(toggle | focus) debug: user.jb_cmd("action ActivateDebugToolWindow")
(toggle | focus) events: user.jb_cmd("action ActivateEventLogToolWindow")
(toggle | focus) terminal: user.jb_cmd("action ActivateTerminalToolWindow")
(toggle | focus) jet: user.jb_cmd("action ActivateVersionControlToolWindow")
(toggle | focus) structure: user.jb_cmd("action ActivateStructureToolWindow")
(toggle | focus) database: user.jb_cmd("action ActivateDatabaseToolWindow")
(toggle | focus) database changes: user.jb_cmd("action ActivateDatabaseChangesToolWindow")
(toggle | focus) make: user.jb_cmd("action ActivatemakeToolWindow")
(toggle | focus) to do: user.jb_cmd("action ActivateTODOToolWindow")
(toggle | focus) docker: user.jb_cmd("action ActivateDockerToolWindow")
(toggle | focus) favorites: user.jb_cmd("action ActivateFavoritesToolWindow")
(toggle | focus) last: user.jb_cmd("action JumpToLastWindow")
# Pin/dock/float
toggle pinned: user.jb_cmd("action TogglePinnedMode")
toggle docked: user.jb_cmd("action ToggleDockMode")
toggle floating: user.jb_cmd("action ToggleFloatingMode")
toggle windowed: user.jb_cmd("action ToggleWindowedMode")
toggle split: user.jb_cmd("action ToggleSideMode")
# Settings, not windows
toggle tool buttons: user.jb_cmd("action ViewToolButtons")
toggle toolbar: user.jb_cmd("action ViewToolBar")
toggle status [bar]: user.jb_cmd("action ViewStatusBar")
toggle navigation [bar]: user.jb_cmd("action ViewNavigationBar")
# Active editor settings
toggle power save: user.jb_cmd("action TogglePowerSave")
toggle whitespace: user.jb_cmd("action EditorToggleShowWhitespaces")
toggle indents: user.jb_cmd("action EditorToggleShowIndentLines")
toggle line numbers: user.jb_cmd("action EditorToggleShowLineNumbers")
toggle bread crumbs: user.jb_cmd("action EditorToggleShowBreadcrumbs")
toggle gutter icons: user.jb_cmd("action EditorToggleShowGutterIcons")
toggle wrap: user.jb_cmd("action EditorToggleUseSoftWraps")
toggle parameters: user.jb_cmd("action ToggleInlineHintsAction")
# Toggleable views
toggle fullscreen: user.jb_cmd("action ToggleFullScreen")
toggle distraction [free mode]: user.jb_cmd("action ToggleDistractionFreeMode")
toggle presentation [mode]: user.jb_cmd("action TogglePresentationMode")
# Tabs
go first tab: user.jb_cmd("action GoToTab1")
go second tab: user.jb_cmd("action GoToTab2")
go third tab: user.jb_cmd("action GoToTab3")
go fourth tab: user.jb_cmd("action GoToTab4")
go fifth tab: user.jb_cmd("action GoToTab5")
go sixth tab: user.jb_cmd("action GoToTab6")
go seventh tab: user.jb_cmd("action GoToTab7")
go eighth tab: user.jb_cmd("action GoToTab8")
go ninth tab: user.jb_cmd("action GoToTab9")
go next tab: user.jb_cmd("action NextTab")
go last tab: user.jb_cmd("action PreviousTab")
go final tab: user.jb_cmd("action GoToLastTab")
clear tab: user.jb_cmd("action CloseActiveTab")
# Quick popups
change scheme: user.jb_cmd("action QuickChangeScheme")
# Always javadoc
toggle (doc | documentation): user.jb_cmd("action QuickJavaDoc")
pop (doc | documentation): user.jb_cmd("action QuickJavaDoc")
(pop deaf | toggle definition): user.jb_cmd("action QuickImplementations")
pop type: user.jb_cmd("action ExpressionTypeInfo")
pop parameters: user.jb_cmd("action ParameterInfo")
# Breakpoints / debugging
go breakpoints: user.jb_cmd("action ViewBreakpoints")
toggle [line] breakpoint: user.jb_cmd("action ToggleLineBreakpoint")
toggle method breakpoint: user.jb_cmd("action ToggleMethodBreakpoint")
step over: user.jb_cmd("action StepOver")
step out: user.jb_cmd("action StepOut")
step into: user.jb_cmd("action StepInto")
step smart: user.jb_cmd("action SmartStepInto")
step to line: user.jb_cmd("action RunToCursor")
resume program: user.jb_cmd("action Resume")
# Grow / Shrink
(grow | shrink) window right: user.jb_cmd("action ResizeToolWindowRight")
(grow | shrink) window left: user.jb_cmd("action ResizeToolWindowLeft")
(grow | shrink) window up: user.jb_cmd("action ResizeToolWindowUp")
(grow | shrink) window down: user.jb_cmd("action ResizeToolWindowDown")
# Dash Searching https://github.com/gdelmas/IntelliJDashPlugin
go [smart] dash: user.jb_cmd("action SmartSearchAction")
go all dash: user.jb_cmd("action SearchAction")

### Selection ###

key(cmd-shift-ctrl-alt-f): app.notify(user.current_jetbrains())

#start template <phrase>:
#    user.jb("action InsertLiveTemplate")
#    sleep(0.3)
#    insert(phrase)
#    key(enter)
#    sleep(0.2)
#    key(enter)

<user.jb_selection> region: user.jb_cmd("{jb_selection}")
<user.jb_selection> this: user.jb_cmd("{jb_selection},action EditorSelectWord")

# <user.jb_selection>    "phrase:
#[utils.select_last_insert
#<user.jb_selection>     "last <phrase> [over]:
#[idea_find("prev")
# <user.jb_selection>    "next <phrase> [over]:
#[idea_find("next")
# <user.jb_selection>    "last bounded <text.alphabet>+:
#[idea_bounded("prev")
# <user.jb_selection>    "next bounded <text.alphabet>+:
#[idea_bounded("next")
<user.jb_selection> last bounded <text.alphabet> <text.alphabet>:
    user.jb_cmd("{jb_selection}")
    user.jb_bounded_search("last", alphabet_1, alphabet_2)
<user.jb_selection> next bounded <text.alphabet> <text.alphabet>:
    user.jb_cmd("{jb_selection}")
    user.jb_bounded_search("next", alphabet_1, alphabet_2)

<user.jb_selection> line:
    user.jb_cmd("action EditorLineStart,action EditorLineEndWithSelection,{jb_selection}")
    user.jb_set_extend("action EditorLineStart,action EditorLineStart,action EditorLineEndWithSelection")

<user.jb_selection> line <number>:
    user.jb_cmd("goto {number} 0,action EditorLineStart,action EditorLineEndWithSelection,{jb_selection}")
    user.jb_set_extend("action EditorLineStart,action EditorLineStart,action EditorLineEndWithSelection")

<user.jb_selection> whole line:
    user.jb_cmd("action EditorSelectLine,{jb_selection}")

<user.jb_selection> whole line <number>:
    user.jb_cmd("goto {number} 0,action EditorSelectLine,{jb_selection}")

<user.jb_selection> lines <number> until <number>:
    user.jb_cmd("range {number_1} {number_2},{jb_selection}")

<user.jb_selection> until line <number>:
    user.jb_cmd("extend {number},{jb_selection}")

# Structure
<user.jb_selection> [<user.ordinal>] <user.jb_psi>:
    user.jb_psi(jb_psi, "select", ordinal)

# Generic Editor
<user.jb_selection> all: user.jb_cmd("action $SelectAll,{jb_selection}")
<user.jb_selection> left: user.jb_cmd("action EditorLeftWithSelection,{jb_selection}")
<user.jb_selection> right: user.jb_cmd("action EditorRightWithSelection,{jb_selection}")
<user.jb_selection> up: user.jb_cmd("action EditorUpWithSelection,{jb_selection}")
<user.jb_selection> down: user.jb_cmd("action EditorDownWithSelection,{jb_selection}")
<user.jb_selection> word left: user.jb_cmd("action EditorPreviousWordWithSelection,{jb_selection}")
<user.jb_selection> word right: user.jb_cmd("action EditorNextWordWithSelection,{jb_selection}")
<user.jb_selection> camel left: user.jb_cmd("action EditorPreviousWordInDifferentHumpsModeWithSelection,{jb_selection}")
<user.jb_selection> camel right: user.jb_cmd("action EditorNextWordInDifferentHumpsModeWithSelection,{jb_selection}")
<user.jb_selection> way left: user.jb_cmd("action EditorLineStartWithSelection,{jb_selection}")
<user.jb_selection> way right: user.jb_cmd("action EditorLineEndWithSelection,{jb_selection}")
<user.jb_selection> way up: user.jb_cmd("action EditorTextStartWithSelection,{jb_selection}")
<user.jb_selection> way down: user.jb_cmd("action EditorTextEndWithSelection,{jb_selection}")

### Movement ###

<user.jb_movement> next (error | air): user.jb_cmd("action GotoNextError,{jb_movement}")
<user.jb_movement> last (error | air): user.jb_cmd("action GotoPreviousError,{jb_movement}")
<user.jb_movement> last <phrase> [over]:
    user.jb_close_search("last", phrase)
    user.jb_cmd("action EditorRight")
    user.jb_cmd(jb_movement)

<user.jb_movement> next <phrase> [over]:
    user.jb_close_search("next", phrase)
    user.jb_cmd("action EditorRight")
    user.jb_cmd(jb_movement)

<user.jb_movement> last bounded <text.alphabet> <text.alphabet>:
    user.jb_bounded_search("last", alphabet_1, alphabet_2)
    user.jb_cmd("action EditorRight")
    user.jb_cmd(jb_movement)

<user.jb_movement> next bounded <text.alphabet> <text.alphabet>:
    user.jb_bounded_search("last", alphabet_1, alphabet_2)
    user.jb_cmd("action EditorRight")
    user.jb_cmd(jb_movement)

<user.jb_movement> line start <number>: user.jb_cmd("goto {number} 0,{jb_movement}")
<user.jb_movement> line ending <number>: user.jb_cmd("goto {number} 9999,{jb_movement}")
# This will put the cursor past the indentation
<user.jb_movement> line <number>:
    user.jb_cmd("goto {number} 9999,action EditorLineEnd,action EditorLineStart,{jb_movement}")
    user.jb_set_extend("")

# Structural
<user.jb_movement> start [<user.ordinal>] <user.jb_psi>:
    user.jb_psi(jb_psi, "start", ordinal)

<user.jb_movement> [end] [<user.ordinal>] <user.jb_psi>:
    user.jb_psi(jb_psi, "end", ordinal)


# Generic
<user.jb_movement> left: user.jb_cmd("{jb_movement},action EditorLeft")
<user.jb_movement> right: user.jb_cmd("{jb_movement},action EditorRight")
<user.jb_movement> up: user.jb_cmd("{jb_movement},action EditorUp")
<user.jb_movement> down: user.jb_cmd("{jb_movement},action EditorDown")
<user.jb_movement> word left: user.jb_cmd("{jb_movement},action EditorPreviousWord")
<user.jb_movement> word right: user.jb_cmd("{jb_movement},action EditorNextWord")
<user.jb_movement> camel left: user.jb_cmd("{jb_movement},action EditorPreviousWordInDifferentHumpsMode")
<user.jb_movement> camel right: user.jb_cmd("{jb_movement},action EditorNextWordInDifferentHumpsMode")
<user.jb_movement> way left: user.jb_cmd("{jb_movement},action EditorLineStart")
<user.jb_movement> way right: user.jb_cmd("{jb_movement},action EditorLineEnd")
<user.jb_movement> way up: user.jb_cmd("{jb_movement},action EditorTextStart")
<user.jb_movement> way down: user.jb_cmd("{jb_movement},action EditorTextEnd")

