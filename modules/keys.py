from talon import Module

from ..wrapper import as_rule
from ..keys import modifiers

mod = Module()

mod.list("named_key", desc="Returns a named key")


@mod.capture
def named_key(m) -> str:
    """Returns a named key"""


@mod.capture(rule=as_rule(modifiers))
def modifier(m) -> str:
    """Returns a named modifier"""
    return "-".join([modifiers[w] for w in m])
