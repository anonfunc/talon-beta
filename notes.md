# notes

notes

    - add ^ and $ anchors to commands! If your command is anchored, it won't allow commands on that side (^ for start, $ for end, both for both) without a pause.
    # this can only be recognized by itself
   ^solo$: "solo"
    # no other commands can be recognized after this, so the phrase will capture everything
    say <phrase>$: insert(phrase)
    # this won't be recognized mid phrase, only at the start
    ^start: "start"

# scopes

from talon import Context, Module
mod = Module()
mode = 'default'
@mod.scope
def scope(new_mode=None):
    global mode
    if new_mode:
        mode = new_mode
    return {'mode': mode}
@mod.action_class
class Actions:
    def set_mode(mode: str):
        scope.update(mode)
9:33
then in a talon file you can:
user.mode: default
-
and:
-
python mode: user.set_mode('python')