user.language: go
-
logical and: insert(" && ")
logical or: insert(" || ")

# Many of these add extra terrible spacing under the assumption that
# gofmt/goimports will erase it.

^state comment: insert("// ")
^[line] comment <phrase>:
            key("cmd-right")
            insert(" // ")
            user.sentence(phrase)
        
#^"add comment <phrase> [over]:
#     key("cmd-right")
#     text_with_leading(" // ")

^[state] context: insert("ctx")
^state (funk | func | fun): insert("func ")
^function (Annette | init) [over]:
            insert("func init() {\n")
        
^function <phrase> [over]:
            insert("func ")
            insert(user.camelcase(phrase))
            insert("(")
            sleep(100ms)
        
^method <phrase> [over]:
            insert("meth ")
            insert(user.camelcase(phrase))
            sleep(100ms)
        
^state var: insert("var ")
^variable <phrase> [over]:
            insert("var ")
            insert(user.camelcase(phrase))
            insert(" ")
            sleep(100ms)
        
        # "set <phrase> [over]: 
        #     insert(user.camelcase(phrase))
        #     insert(" : = ")
        #     sleep(100ms)
        # 
^state break: insert("break")
^state (chan | channel): insert(" chan ")
^state go: insert("go ")
^state if: insert("if ")
^if <phrase> [over]:
    insert("if ")
    insert(user.camelcase(phrase))
^state else if: insert(" else if ")
^else if <phrase> [over]:
    insert(" else if ")
    insert(user.camelcase(phrase))

^state else: insert(" else ")
^else <phrase> [over]:
    insert(" else {")
    key("enter")
    insert(user.camelcase(phrase))

# actually a live template for "for" with a single condition
^state while: insert("while")
^while <phrase> [over]:
    insert("while ")
    insert(user.camelcase(phrase))
^state for: insert("for ")
^for <phrase> [over]:
    insert("for ")
    insert(user.camelcase(phrase))
^state for range: insert("forr ")
^range <phrase> [over]:
    insert("forr ")
    insert(user.camelcase(phrase))
^state format: insert("fmt")
^format <phrase> [over]:
    insert("fmt.")
    insert(user.uppercamel(phrase))
^state switch: insert("switch ")
^switch <phrase> [over]:
    insert("switch ")
    insert(user.camelcase(phrase))
^state select: insert("select ")
# "select <phrase>:
#    insert("select ")
#    insert(user.camelcase(phrase))
^state (const | constant): insert(" const ")
^constant <phrase> [over]:
    insert("const ")
    insert(user.uppercamel(phrase))
^state case: insert(" case ")
^state default: insert(" default: ")
^case <phrase> [over]:
    insert("case ")
    insert(user.camelcase(phrase))
^state type: insert(" type ")
^type <phrase> [over]:
    insert("type ")
    insert(user.uppercamel(phrase))
^state true: insert(" true ")
^state false: insert(" false ")
^state (start | struct | struck):
    insert(" struct {")
    key("enter")
^(struct | struck) <phrase> [over]:
    insert(" struct {")
    key("enter")
    insert(user.uppercamel(phrase))
    
^[state] empty interface: insert(" interface{} ")
^state interface:
    insert(" interface {")
    key("enter")
^interface <phrase> [over]:
    insert(" interface {")
    key("enter")
    insert(user.uppercamel(phrase))

^private field [<phrase>] [over]:
    insert(user.uppercamel(phrase))
^exported field [<phrase>] [over]:
    insert(user.uppercamel(phrase))
of type string: insert(" string")
of type <phrase> [over]:
    insert(" {user.uppercamel(phrase)}")

^state string: insert(" string ")
^[state] (int | integer | ant): insert(" int ")
^state slice: insert(" []")
^[state] (no | nil): insert("nil")
^state (int | integer | ant) 64: insert(" int64 ")
^state tag:
    insert(" ``")
    key("left")
^tag <phrase> [over]:
    insert(" `")
    sleep(100ms)
    insert(user.lowsmash(user.jargon(phrase)))
    insert(' ')
    sleep(100ms)
        
^state return: insert(" return ")
^return  <phrase> [over]:
    insert("return ")
    insert(user.camelcase(phrase))
^map of string to string: insert(" map[string]string ")
^map of <phrase> [over]:
    insert("map[")
    insert(user.camelcase(phrase))
    key("right")
    sleep(100ms)
        
^receive: insert(" <- ")
^make: insert("make(")
^loggers [<phrase>] [over]:
    insert("logrus.")
    insert(user.uppercamel(phrase))
^length <phrase> [over]:
    insert("len(")
    insert(user.camelcase(phrase))
^append <phrase> [over]:
    insert("append(")
    insert(user.camelcase(phrase))
^state (air | err): insert("err")
^error: insert(" err ")
^loop over <phrase> [over]:
    insert(user.camelcase(phrase))
    insert(".forr ")
^item <phrase> [over]:
    insert(", ")
    insert(user.camelcase(phrase))
^value <phrase> [over]:
    insert(": ")
    insert(user.camelcase(phrase))