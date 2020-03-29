# # Copy selection to clipboard
# copy this: edit.copy()
# # Cut selection to clipboard
# cut this: edit.cut()
# # Delete selection
# clear this: edit.delete()
# # Delete line under cursor
# clear line: edit.delete_line()
# # Delete paragraph under cursor
# clear paragraph: edit.delete_paragraph()
# # Delete sentence under cursor
# clear sentence: edit.delete_sentence()
# # Delete word under cursor
# clear word: edit.delete_word()
# # Move cursor down one row
# go down: edit.down()
# # Extend selection again in the same way
# extend: edit.extend_again()
# # Extend selection to column <n>
# extend to column <number>: edit.extend_column(number)
# # Extend selection down one row
# select down: edit.extend_down()
# # Extend selection to end of file
# select way down: edit.extend_file_end()
# # Extend selection to start of file
# select way up: edit.extend_file_start()
# # Extend selection left one column
# select left: edit.extend_left()
# # Extend selection to include line <n>
# select until line <number>: edit.extend_line(number)
# # Extend selection down one full line
# select down: edit.extend_line_down()
# # Extend selection to end of line
# select way right: edit.extend_line_end()
# # Extend selection to start of line
# select way left: edit.extend_line_start()
# # Extend selection up one full line
# select up: edit.extend_line_up()
# # Extend selection down one page
# select page down: edit.extend_page_down()
# # Extend selection up one page
# select page up: edit.extend_page_up()
# # Extend selection to the end of the current paragraph
# # XXX: edit.extend_paragraph_end()
# # Extend selection to the start of the next paragraph
# # XXX: edit.extend_paragraph_next()
# # Extend selection to the start of the previous paragraph
# # XXX: edit.extend_paragraph_previous()
# # Extend selection to the start of the current paragraph
# # XXX: edit.extend_paragraph_start()
# # Extend selection right one column
# # XXX: edit.extend_right()
# # Extend selection to the end of the current sentence
# # XXX: edit.extend_sentence_end()
# # Extend selection to the start of the next sentence
# # XXX: edit.extend_sentence_next()
# # Extend selection to the start of the previous sentence
# # XXX: edit.extend_sentence_previous()
# # Extend selection to the start of the current sentence
# # XXX: edit.extend_sentence_start()
# # Extend selection up one row
# select up: edit.extend_up()
# # Extend selection left one word
# select word left: edit.extend_word_left()
# # Extend selection right one word
# select word right: edit.extend_word_right()
# # Move cursor to end of file (start of line)
# select way down: edit.file_end()
# # Move cursor to start of file
# select way up: edit.file_start()
# # Open Find dialog, optionally searching for text
# search [for <phrase>] [over]: edit.find(phrase)
# # Select next Find result
# go next result: edit.find_next()
# # Select previous Find result
# go last result: edit.find_previous()
# # Remove a tab stop of indentation
# unindent: edit.indent_less()
# # Add a tab stop of indentation
# indent: edit.indent_more()
# # Move cursor to column <n>
# go column <number>: edit.jump_column(number)
# # Move cursor to line <n>
# go line <number>: edit.jump_line(number)
# # Move cursor left one column
# go left: edit.left()
# # Create a new line identical to the current line
# clone line: edit.line_clone()
# # Move cursor to start of line below
# go line down: edit.line_down()
# # Move cursor to end of line
# go way right: edit.line_end()
# # Insert line below cursor
# create next line: edit.line_insert_down()
# # Insert line above cursor
# create last line: edit.line_insert_up()
# # Move cursor to start of line
# go way right: edit.line_start()
# # Swap the current line with the line below
# drag down: edit.line_swap_down()
# # Swap the current line with the line above
# drag up: edit.line_swap_up()
# # Move cursor to start of line above
# go line up: edit.line_up()
# # Move cursor again in the same way
# # XXX extend: edit.move_again()
# # Move cursor down one page
# go page down: edit.page_down()
# # Move cursor up one page
# go page up: edit.page_up()
# # Move cursor to the end of the current paragraph
# # XXX edit.paragraph_end()
# # Move cursor to the start of the next paragraph
# # XXX edit.paragraph_next()
# # Move cursor to the start of the previous paragraph
# # XXX edit.paragraph_previous()
# # Move cursor to the start of the current paragraph
# # XXX edit.paragraph_start()
# # Paste clipboard at cursor
# paste here: edit.paste()
# # Paste clipboard without style information
# paste matching here: edit.paste_match_style()
# # Open print dialog
# # XXX edit.print()
# # Redo
# redo: edit.redo()
# # Move cursor right one column
# go right: edit.right()
# # Save current document
# save current: edit.save()
# # Save all open documents
# save all: edit.save_all()
# # Select all text in the current document
# select all: edit.select_all()
# # Select entire line <n>, or current line
# select line <number>: edit.select_line(number)
# # Select entire lines from <a> to <b>
# select line <number> until <number>: edit.select_lines(number_1, number_2)
# # Clear current selection
# select nothing: edit.select_none()
# # Select the entire nearest paragraph
# # XXX edit.select_paragraph()
# # Select the entire nearest sentence
# # XXX edit.select_sentence()
# # Select word under cursor
# select this word: edit.select_word()
# # Get currently selected text
# # XXX edit.selected_text() -> str
# # Insert a copy of the current selection
# clone this: edit.selection_clone()
# # Move cursor to the end of the current sentencej
# # XXX edit.sentence_end()
# # Move cursor to the start of the next sentence
# # XXX edit.sentence_next()
# # Move cursor to the start of the previous sentence
# # XXX edit.sentence_previous()
# # Move cursor to the start of the current sentence
# # XXX edit.sentence_start()
# # Undo
# undo: edit.undo()
# # Move cursor up one row
# go up: edit.up()
# # Move cursor left one word
# go word left: edit.word_left()
# # Move cursor right one word
# go word right: edit.word_right()
# # Zoom in
# zoom in: edit.zoom_in()
# # Zoom out
# zoom out: edit.zoom_out()
# # Zoom to original size
# zoom clear: edit.zoom_reset()
    #
###
### Copy and implement in new apps:
###
# Copy selection to clipboard
# action(edit.copy)
# Cut selection to clipboard
# action(edit.cut)
# Delete selection
# action(edit.delete)
# Delete line under cursor
# action(edit.delete_line)
# Delete paragraph under cursor
# action(edit.delete_paragraph)
# Delete sentence under cursor
# action(edit.delete_sentence)
# Delete word under cursor
# action(edit.delete_word)
# Move cursor down one row
# action(edit.down)
# Extend selection again in the same way
# action(edit.extend_again)
# Extend selection to column <n>
# action(edit.extend_column(n: in)
# Extend selection down one row
# action(edit.extend_down)
# Extend selection to end of file
# action(edit.extend_file_end)
# Extend selection to start of file
# action(edit.extend_file_start)
# Extend selection left one column
# action(edit.extend_left)
# Extend selection to include line <n>
# action(edit.extend_line(n: in)
# Extend selection down one full line
# action(edit.extend_line_down)
# Extend selection to end of line
# action(edit.extend_line_end)
# Extend selection to start of line
# action(edit.extend_line_start)
# Extend selection up one full line
# action(edit.extend_line_up)
# Extend selection down one page
# action(edit.extend_page_down)
# Extend selection up one page
# action(edit.extend_page_up)
# Extend selection to the end of the current paragraph
# action(edit.extend_paragraph_end)
# Extend selection to the start of the next paragraph
# action(edit.extend_paragraph_next)
# Extend selection to the start of the previous paragraph
# action(edit.extend_paragraph_previous)
# Extend selection to the start of the current paragraph
# action(edit.extend_paragraph_start)
# Extend selection right one column
# action(edit.extend_right)
# Extend selection to the end of the current sentence
# action(edit.extend_sentence_end)
# Extend selection to the start of the next sentence
# action(edit.extend_sentence_next)
# Extend selection to the start of the previous sentence
# action(edit.extend_sentence_previous)
# Extend selection to the start of the current sentence
# action(edit.extend_sentence_start)
# Extend selection up one row
# action(edit.extend_up)
# Extend selection left one word
# action(edit.extend_word_left)
# Extend selection right one word
# action(edit.extend_word_right)
# Move cursor to end of file (start of line)
# action(edit.file_end)
# Move cursor to start of file
# action(edit.file_start)
# Open Find dialog, optionally searching for text
# action(edit.find(text: str = Non)
# Select next Find result
# action(edit.find_next)
# Select previous Find result
# action(edit.find_previous)
# Remove a tab stop of indentation
# action(edit.indent_less)
# Add a tab stop of indentation
# action(edit.indent_more)
# Move cursor to column <n>
# action(edit.jump_column(n: in)
# Move cursor to line <n>
# action(edit.jump_line(n: in)
# Move cursor left one column
# action(edit.left)
# Create a new line identical to the current line
# action(edit.line_clone)
# Move cursor to start of line below
# action(edit.line_down)
# Move cursor to end of line
# action(edit.line_end)
# Insert line below cursor
# action(edit.line_insert_down)
# Insert line above cursor
# action(edit.line_insert_up)
# Move cursor to start of line
# action(edit.line_start)
# Swap the current line with the line below
# action(edit.line_swap_down)
# Swap the current line with the line above
# action(edit.line_swap_up)
# Move cursor to start of line above
# action(edit.line_up)
# Move cursor again in the same way
# action(edit.move_again)
# Move cursor down one page
# action(edit.page_down)
# Move cursor up one page
# action(edit.page_up)
# Move cursor to the end of the current paragraph
# action(edit.paragraph_end)
# Move cursor to the start of the next paragraph
# action(edit.paragraph_next)
# Move cursor to the start of the previous paragraph
# action(edit.paragraph_previous)
# Move cursor to the start of the current paragraph
# action(edit.paragraph_start)
# Paste clipboard at cursor
# action(edit.paste)
# Paste clipboard without style information
# action(edit.paste_match_style)
# Open print dialog
# action(edit.print)
# Redo
# action(edit.redo)
# Move cursor right one column
# action(edit.right)
# Save current document
# action(edit.save)
# Save all open documents
# action(edit.save_all)
# Select all text in the current document
# action(edit.select_all)
# Select entire line <n>, or current line
# action(edit.select_line(n: int = Non)
# Select entire lines from <a> to <b>
# action(edit.select_lines(a: int, b: in)
# Clear current selection
# action(edit.select_none)
# Select the entire nearest paragraph
# action(edit.select_paragraph)
# Select the entire nearest sentence
# action(edit.select_sentence)
# Select word under cursor
# action(edit.select_word)
# Get currently selected text
# action(edit.selected_text() -> sr
# Insert a copy of the current selection
# action(edit.selection_clone)
# Move cursor to the end of the current sentence
# action(edit.sentence_end)
# Move cursor to the start of the next sentence
# action(edit.sentence_next)
# Move cursor to the start of the previous sentence
# action(edit.sentence_previous)
# Move cursor to the start of the current sentence
# action(edit.sentence_start)
# Undo
# action(edit.undo)
# Move cursor up one row
# action(edit.up)
# Move cursor left one word
# action(edit.word_left)
# Move cursor right one word
# action(edit.word_right)
# Zoom in
# action(edit.zoom_in)
# Zoom out
# action(edit.zoom_out)
# Zoom to original size
# action(edit.zoom_reset)