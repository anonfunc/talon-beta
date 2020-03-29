user.language: py
-
logical and: insert(" and ")
logical or: insert(" or ")
state comment: insert("# ")
[line] comment <phrase> [over]:
    key("cmd-right")
    insert("  # ")
    user.sentence(phrase)

# "add comment <phrase> [over]:
#     key("cmd-right")
#     text_with_leading(" # ")
# 

state (def | deaf | deft): insert("def ")
function <phrase> [over]:
    insert("def ")
    user.downscored(phrase)
    insert("():")
    key("left left")

method <phrase> [over]:
    insert("def ")
    user.downscored(phrase)
    insert("(self, ):")
    key("left left")

state else if: insert("elif ")
state if: insert("if ")
is not none: insert(" is not None")
is none: insert(" is None")
if <phrase> [over]:
    insert("if ")
    user.downscored(phrase)
state while: insert("while ")
while <phrase> [over]:
    insert("while ")
    user.downscored(phrase)

state for: insert("for ")
for <phrase> [over]:
    insert("for ")
    user.downscored(phrase)
body:key("cmd-right : enter")
state import: insert("import ")
import <phrase> [over]:
    insert("for ")
    user.dotted(phrase)
state class: insert("class ")
class <phrase> [over]:
    insert("class ")
    user.uppercamel(phrase)
    insert(":\n")

state (past | pass): insert("pass")
state true: insert("True")
state false: insert("False")
state none: insert("None")
item <phrase> [over]:
    insert(", ")
    user.downscored(phrase)