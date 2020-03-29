#   Return the last executed command
# core.last_command() -> Tuple[talon.scripting.types.CommandImpl, talon.grammar.vm.Capture]
#   Return the last-spoken phrase
# core.last_phrase() -> talon.grammar.vm.Capture
#   Return recently executed commands (grouped by phrase)
# core.recent_commands() -> Sequence[Tuple[talon.scripting.types.CommandImpl, talon.grammar.vm.Capture]]
#   Return recently-spoken phrases
# core.recent_phrases() -> Sequence[talon.grammar.vm.Capture]
#   Repeat the last command N times
# core.repeat_command(times: int = 1)
#   Repeat the last phrase N times
# core.repeat_phrase(times: int = 1)
#   Replace the current command in history with one or more commands
# core.replace_command(commands: Sequence[Tuple[talon.scripting.types.CommandImpl, talon.grammar.vm.Capture]])
#   Run a single command for a recognized phrase
# core.run_command(cmd: talon.scripting.types.CommandImpl, m: talon.grammar.vm.Capture)
#   Run a function for a command, passing the command's Capture object to it.
# core.run_function(ctx: talon.scripting.rctx.ResourceContext, func: Callable[[talon.grammar.vm.Capture], NoneType], m: talon.grammar.vm.Capture)
#   Run all commands for a hotkey
# core.run_hotkey(hotkey: talon.scripting.types.HotkeyImpl)
#   "Run" a list, by calling core.run_unknown() on each item.
# core.run_list(ctx: talon.scripting.rctx.ResourceContext, items: Sequence[Any], m: talon.grammar.vm.Capture)
#   Run all commands for a recognized phrase
# core.run_phrase(phrase: talon.grammar.vm.Capture)
#   "Run" a string. Typically just calls actions.insert(s).
# core.run_string(string: str)
#   Run a single TalonScript for a recognized phrase
# core.run_talon_script(ctx: talon.scripting.rctx.ResourceContext, script: talon.scripting.talon_script.TalonScript, m: talon.grammar.vm.Capture)
#   Run a single part of a command,
#             by checking the type and calling one of
# core.run_unknown(ctx: talon.scripting.rctx.ResourceContext, unknown: Any, m: talon.grammar.vm.Capture)
#
#   Apply text formatting, such as auto spacing, for the native language
# auto_format(text: str) -> str
#   Insert text at the current cursor position, automatically formatting it using the actions.auto_format(text)
# auto_insert(text: str)
#   Insert text at the current cursor position
# insert(text: str)
#   Press one or more keys by name, space-separated
# key(key: str)
#   NOT IMPLEMENTED
# modifiers()
#   Click, hold, or release a mouse button
# mouse_click(button: int = 0, down: bool = None, up: bool = None, hold: int = None)
#   Move mouse to (x, y) coordinate
# mouse_move(x: int, y: int)
#   Scroll the mouse wheel
# mouse_scroll(y: int = 0, x: int = 0, by_lines: bool = False)
#   Display text in the log
# print(text: str)
#   Pause for some duration.
#             If you use a number, it is seconds, e.g 1.5 seconds or 0.001 seconds.
#             If you use a string, it is a timespec, such as "50ms" or "10s"
# sleep(duration: Union[float, str])
#
#   Join a list of words into a single string for insertion
# dictate.join_words(words: Sequence[str], separator: str = ' ') -> str
#   Insert lowercase text
# dictate.lower(p: talon.grammar.vm.Phrase)
#   Insert naturally-capitalized text
# dictate.natural(p: talon.grammar.vm.Phrase)
#   Extract words from a spoken Capture
# dictate.parse_words(p: talon.grammar.vm.Phrase) -> Sequence[str]
#   Replace words according to the dictate.word_map dictionary setting
# dictate.replace_words(words: Sequence[str]) -> Sequence[str]


# Get active app's bundle identifier
# XXX : app.bundle() -> str
# Get active app's executable name
# XXX : app.executable() -> str
# Get active app's name
# XXX : app.name() -> str
# Show a desktop notification
# XXX : app.notify(body: str = '', title: str = '', subtitle: str = '', sound: bool = False)
# Get active app's file path
# XXX : app.path() -> str
# Open app preferences
# XXX : app.preferences()
# Close the current tab
# XXX : app.tab_close()
# Move the current tab to a new window
# XXX : app.tab_detach()
# Switch to next tab for this window
# XXX : app.tab_next()
# Open a new tab
# XXX : app.tab_open()
# Switch to previous tab for this window
# XXX : app.tab_previous()
# Re-open the last-closed tab
# XXX : app.tab_reopen()
# Close the current window
# XXX : app.window_close()
# Hide the current window
# XXX : app.window_hide()
# Hide all other windows
# XXX : app.window_hide_others()
# Switch to next window for this app
# XXX : app.window_next()
# Open a new window
# XXX : app.window_open()
# Switch to previous window for this app
# XXX : app.window_previous()
# Return the open file's extension
# XXX : win.file_ext() -> str
# Return the open filename
# XXX : win.filename() -> str
# Get page URL
# XXX : browser.address() -> str
# Bookmark the current page
# XXX : browser.bookmark()
# Bookmark all open tabs
# XXX : browser.bookmark_tabs()
# Open the Bookmarks editor
# XXX : browser.bookmarks()
# Toggle the bookmarks bar
# XXX : browser.bookmarks_bar()
# Focus address bar
# XXX : browser.focus_address()
# Focus the page body
# XXX : browser.focus_page()
# Focus the search box
# XXX : browser.focus_search()
# Go to a new URL
# XXX : browser.go(url: str)
# Go back in the history
# XXX : browser.go_back()
# Go to a blank page
# XXX : browser.go_blank()
# Go forward in the history
# XXX : browser.go_forward()
# Go to home page
# XXX : browser.go_home()
# Open a private browsing window
# XXX : browser.open_private_window()
# Reload current page
# XXX : browser.reload()
# Reload current page (harder)
# XXX : browser.reload_hard()
# Reload current page (hardest)
# XXX : browser.reload_hardest()
# Show 'Clear Cache' dialog
# XXX : browser.show_clear_cache()
# Show download list
# XXX : browser.show_downloads()
# Show installed extensions
# XXX : browser.show_extensions()
# Show recently visited pages
# XXX : browser.show_history()
# Submit the current form
# XXX : browser.submit_form()
# Get page title
# XXX : browser.title() -> str
# Open or close the developer tools
# XXX : browser.toggle_dev_tools()
# Disable speech recognition
# XXX : speech.disable()
# Enable speech recognition
# XXX : speech.enable()
# Test if speech recognition is enabled
# XXX : speech.enabled() -> bool
# Return a list of available language codes
# XXX : speech.languages() -> Sequence[str]
# Set the currently active language
# XXX : speech.switch_language(language: str)
# Toggle speech recognition
# XXX : speech.toggle(value: bool = None)
# Copy application bundle
# XXX : user.copy_bundle()
# Format phrase with formatters
# XXX : user.format(formatters: list, phrase: list) -> str
