###
### Might remove some of these and use amethyst.
###

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
^open preferences: app.preferences()
# Close the current tab
^clear tab: app.tab_close()
# Move the current tab to a new window
^detach tab: app.tab_detach()
# Switch to next tab for this window
^go next tab: app.tab_next()
# Open a new tab
^create tab: app.tab_open()
# Switch to previous tab for this window
^go last tab: app.tab_previous()
# Re-open the last-closed tab
^undo tab close: app.tab_reopen()
# Close the current window
^clear window: app.window_close()
# Hide the current window
^hide window: app.window_hide()
# Hide all other windows
^hide other windows: app.window_hide_others()
# Switch to next window for this app
^go next window: app.window_next()
# Open a new window
^create window: app.window_open()
# Switch to previous window for this app
^go last window: app.window_previous()