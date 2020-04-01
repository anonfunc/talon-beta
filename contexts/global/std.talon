copy bundle: user.copy_bundle()
show current engine: app.notify(user.current_engine())

literal <phrase>++: insert(phrase)
say <phrase> [over]: dictate.natural(phrase)
# sentence <phrase> [over]: sentence_text
# sentence <phrase> [over]: sentence_text,  # Formatters.
# comma <phrase> [over]: [", ", text]
# period <phrase> [over]: [". ", text]
# more <phrase> [over]: [" ", text]
more <phrase> [over]: 
    key("space")
    dictate.natural(phrase)

word <word>: insert(word)
numeral <number>: insert(number)


# Shortcuts

slap: key("cmd-right enter")
slappy: key("cmd-right space")
# cape: key("escape")
# pa: key("space")

# Symbols

question [mark]: insert("?")
tilde: insert("~")
(bang | exclamation point): insert("!")
dollar [sign]: insert("$")
downscore: insert("_")
colon: insert(":")
(paren | left paren): insert("(")
(rparen | are paren | right paren): insert(")")
(brace | left brace): insert("{")
(rbrace | are brace | right brace): insert("}")
# Square Brackets are in basic_keys.py!
(angle | left angle | less than): insert("<")
(rangle | are angle | right angle | greater than): insert(">")
(star | asterisk): insert("*")
(pound | hash [sign] | octo | thorpe | number sign): insert("#")
(percent [sign] | modulo): insert("%")
caret: insert("^")
(at sign | arobase): insert("@")
ampersand: insert("&")
pipe: insert("|")
(dubquote | double quote): insert('"')
triple tick: insert("'''")
triple quote: insert('"""')
# Swipe moved to language.py XXX
item: insert(", ")
value: insert(": ")
# space: " ",  # basic_keys.py
(args | arguments):
    insert("()")
    key("left")

block:
    insert("{}")
    key("left enter")

empty array: insert("[]")
(empty dict | empty dictionary): insert("{}")
plus: insert("+")
arrow: insert("->")
# call: "()"
indirect: insert("&")
dereference: insert("*")
assign: insert(" = ")
[op] set to: insert(" := ")
(minus | subtract): insert(" - ")
add: insert(" + ")
(times | multiply): insert(" * ")
(divide | divided by): insert(" / ")
modulo: insert(" % ")
(minus | subtract) equals: insert(" -= ")
(plus | add) equals: insert(" += ")
(times | multiply) equals: insert(" *= ")
divide equals: insert(" /= ")
(mod | modulo) equals: insert(" %= ")
is greater [than]: insert(" > ")
is less [than]: insert(" < ")
is equal [to]: insert(" == ")
is not [equal] [to]: insert(" != ")
is greater [than] or equal [to]: insert(" >= ")
is less [than] or equal [to] : insert(" <= ")
to the power of: insert(" ** ")
## Language specific, moved to language.py.
# logical and: insert(" && ")
# logical or: insert(" || ")
bitwise and: insert(" & ")
bitwise or: insert(" | ")
(piped | alternate): insert(" | ")
bitwise exclusive or: insert(" ^ ")
[bitwise] left shift: insert(" << ")
[bitwise] right shift: insert(" >> ")
bitwise and equals: insert(" &= ")
bitwise or equals: insert(" |= ")
bitwise exclusive or equals: insert(" ^= ")
[bitwise] left shift equals: insert(" <<= ")
[bitwise] right shift equals: insert(" >>= ")

# [focus] next window: key("cmd-`")
# [focus] last window: key("cmd-shift-`")
# [focus] next app: key("cmd-tab")
# [focus] last app: key("cmd-shift-tab")
# [focus] next tab: key("ctrl-tab")
# [focus] last tab: key("ctrl-shift-tab")
# create tab: key("cmd-t")
# create window: key("cmd-n")
# undo: key("cmd-z")

# Moved to amethyst.py
# next space: key("cmd-alt-ctrl-right")
# last space: key("cmd-alt-ctrl-left")
# copy active bundle: copy_bundle