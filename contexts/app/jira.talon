app: org.mozilla.firefox
title: / JIRA2/
-

go dashboard:
    key("g d")
go boards:
    key("g a")
go issues:
    key("g i")
search:
    key("/")
go create:
    key("c")
assign [to] <phrase> [over]:
    key("a")
    sleep(600ms)
    insert(phrase)
    
assign to me:
    key("i")
comment:
    key("m")
edit:
    key("e")
^(action | please) [<phrase>] [over]$:
    key(".")
    sleep(600ms)
    insert(phrase)
submit:
    key("ctrl+return")
copy link:
    key("cmd+l cmd+c")
copy id:
    key("cmd+l right alt+shift+left alt+shift+left cmd+c")