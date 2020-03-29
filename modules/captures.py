from talon import Module

from ..formatting import named_formatters
from ..keys import modifiers
from ..wrapper import as_rule

mod = Module()

ordinal_indexes = {
    "first": 0,
    "second": 1,
    "third": 2,
    "fourth": 3,
    "fifth": 4,
    "sixth": 5,
    "seventh": 6,
    "eighth": 7,
    "ninth": 8,
    "tenth": 9,
    "final": -1,
    "next": "next",  # Yeah, yeah, not a number.
    "last": "last",
    "this": "this",
}


@mod.capture(rule=as_rule(named_formatters))
def formatter(m) -> list:
    """Returns a named modifier"""
    return [named_formatters[w] for w in m]


@mod.capture(rule=as_rule(modifiers))
def modifier(m) -> str:
    """Returns a named modifier"""
    return "-".join([modifiers[w] for w in m])


mod.list("named_key", desc="Returns a named key")


@mod.capture
def named_key(m) -> str:
    """Returns a named key"""


mod.list("direction", desc="Returns a direction")


@mod.capture
def direction(m) -> str:
    """Returns a direction"""


@mod.capture(rule=as_rule(ordinal_indexes))
def ordinal(m) -> list:
    """Returns an ordinal"""
    return ordinal_indexes[m[0]]
