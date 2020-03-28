
alphabet = dict(zip(("air bat cap drum each fine gust harp sit jury crunch look made near "
                     + "odd pit quench red sun trap urge vest whale plex yank zip"
                     ).split(), "abcdefghijklmnopqrstuvwxyz"))
alphabet["kush"] = "k"
alphabet["nor"] = "n"
alphabet["oil"] = "o"
alphabet["yes"] = "y"

digits = {str(i): str(i) for i in range(10)}

# arrows are separated because 'up' has a high false positive rate
named_keys = {k: k for k in ["tab", "escape", "enter", "space", "home", "pageup", "pagedown", "end"]}

named_keys.update({"delete": "backspace", "forward delete": "delete"})
# named_keys.update({f"F p{i}": f"f{i}" for i in range(1, 13)})

named_keys.update({
    "back tick": "`",
    "comma": ",",
    "dot": ".",
    "point": ".",
    "period": ".",
    "semi": ";",
    "semicolon": ";",
    "tick": "'",
    "quote": '"',
    "L square": "[",
    "left square": "[",
    "square": "[",
    "R square": "]",
    "right square": "]",
    "forward slash": "/",
    "slash": "/",
    "backslash": "\\",
    "minus": "-",
    "dash": "-",
    "equals": "=",
})

modifiers = {
    "command": "cmd",
    "control": "ctrl",
    "shift": "shift",
    "alt": "alt",
    "option": "alt",
}

arrows = {k: k for k in ["left", "right", "up", "down", "pageup", "pagedown"]}

