app: com.tinyspeck.slackmacgap
-

^create message: key("cmd-n")
^search [<phrase>] [over]:
    key("cmd-k")
    insert(phrase)
^jump [<phrase>] [over]:
    key("cmd-k")
    insert(phrase)
^jump direct [<phrase>] [over]:
    key("cmd-shift-k")
    insert(phrase)
^correct: key("cmd-up")
^go back: key("cmd-[")
^go forward: key("cmd-]")
^go unread: key("cmd-shift-a")
^go threads: key("cmd-shift-t")
^go status: key("cmd-shift-y")
^go mentions: key("cmd-shift-m")
^go info: key("cmd-shift-i")
^go saved: key("cmd-shift-s")

^toggle sidebar: key("cmd-.")
### channel navigation
^go next unread: key("alt-shift-down")

### Go up/down to focus messages
^thread$: key("t")
^edit$: key("e")
^star$: key("a")
^pin$: key("p")
^react [<phrase>] [over]:
    key("r")
    insert(phrase)

