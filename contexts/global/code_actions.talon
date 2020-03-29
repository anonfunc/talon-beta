###
### Spoken commands for IDEs.  Not sure I like the way these are organized,
### will probably roll my own again.
###

# Trigger code autocomplete
complete : code.complete()
# Extend selection to end of current scope
# XXX : code.extend_scope_end()
# Extend selection to start of first inner scope
# XXX : code.extend_scope_in()
# Extend selection to start of next sibling scope
# XXX : code.extend_scope_next()
# Extend selection to start of outer scope
# XXX : code.extend_scope_out()
# Extend selection to start of previous sibling scope
# XXX : code.extend_scope_previous()
# Extend selection to start of current scope
# XXX : code.extend_scope_start()
# Return the active programming language
# XXX : code.language() -> str
# Rename selection to <name>
rename as <phrase> : code.rename(phrase)
# Move cursor to end of current scope
# XXX : code.scope_end()
# Move cursor to start of first inner scope
# XXX : code.scope_in()
# Move cursor to start of next sibling scope
# XXX : code.scope_next()
# Move cursor to start of outer scope
# XXX : code.scope_out()
# Move cursor to start of previous sibling scope
# XXX : code.scope_previous()
# Move cursor to start of current scope
# XXX : code.scope_start()
# Select scope under cursor
# XXX : code.select_scope()
# Toggle comments on the current line(s)
comment line: # XXX : code.toggle_comment()