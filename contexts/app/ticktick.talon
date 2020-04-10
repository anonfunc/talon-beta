app: com.TickTick.task.mac
-
sync task: key("cmd-s")
search task: key("cmd-f")
search task [<phrase>] [over]:
    key("cmd-f")
    sleep(300ms)
    insert(phrase)

add task: key("cmd-n")
add task [<phrase>] [over]:
    key("cmd-n")
    sleep(300ms)
    insert(phrase)

complete task: key("shift-cmd-m")
clear date: key("cmd-0")
set today: key("cmd-1")
set tomorrow: key("cmd-2")
set next week: key("cmd-3")

# Rebound, existing was ctrl only, conflict with spaces
set no priority: key("cmd-ctrl-0")
set low priority: key("cmd-ctrl-1")
set medium priority: key("cmd-ctrl-2")
set high priority: key("cmd-ctrl-3")
# Conflict with Alfred clipboard
go calendar: key("shift-ctrl-cmd-c")

# Back to defaults
go today: key("alt-cmd-t")
go tomorrow: key("ctrl-cmd-t")
go next seven days: key("alt-cmd-n")
go all: key("alt-cmd-a")
go assigned: key("ctrl-cmd-a")
go complete: key("alt-cmd-c")