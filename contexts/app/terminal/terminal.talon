app: com.googlecode.iterm2
-
^(cd | city | C D) parent:
    insert("cd ..\n")

^(cd | city | C D) back:
    insert("cd -\n")

^(cd | city | C D) [<phrase>] [over]:
    insert("cd ")
    key("tab")
    insert(phrase)

^file [<phrase>] [over]:
    key("ctrl-t")
    insert(phrase)

dash [<phrase>] [over]:
    insert(" -")
    key("tab")
    insert(phrase)

and [<phrase>] [over]:
    insert(" ")
    insert(phrase)
    key("tab")

^list:
    insert("ls\n")

^accept: insert("\n\n")

^clear terminal: key("ctrl-l")

### Git

^jet [<phrase>] [over]:
    insert("git ")
    insert(phrase)

^jet add [<phrase>] [over]:
    insert("git add ")
    insert(phrase)

^jet commit:
    insert("git commit")

^jet commit [<phrase>] [over]:
    insert("git commit -m \"{phrase}\"")

### Navi / Cheat

^cheat [<phrase>] [over]:
    key("ctrl-g")
    insert(phrase)