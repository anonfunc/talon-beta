"""

Implementation of Talon captures in talon.registry.decls.captures

"""

from typing import Dict, Any

from talon import Context

from ... import keys, numbers, wrapper, formatting

ctx = Context()

# mod = Module()
# mod.list("alpha", desc="Alphabet")

ctx.lists["self.alphabet"] = keys.alphabet


@ctx.capture(path="text.alphabet", rule="{self.alphabet}")
def text_alphabet(m) -> str:
    return m.alphabet


@ctx.capture(path="digits", rule=wrapper.as_rule(numbers.digits_map))
def digits(m) -> int:
    return int("".join([str(numbers.digits_map[n]) for n in m]))


@ctx.capture(path="number_small", rule=wrapper.as_rule(numbers.small_numeral_map))
def number_small(m) -> str:
    return numbers.words_to_numerals([n for n in m])


@ctx.capture(path="number", rule=wrapper.as_rule(numbers.numeral_map))
def number(m) -> str:
    return numbers.words_to_numerals([n for n in m])


@ctx.capture(path="number_signed", rule="(positive | negative) <number>")
def number_signed(m) -> str:
    print(m)
    if m[0] == "negative":
        return f"-{m.number}"
    return m.number


ctx.lists["self.named_key"] = keys.named_keys


@ctx.capture(rule="{self.named_key}")
def named_key(m):
    return m.named_key


ctx.lists["self.direction"] = keys.arrows


@ctx.capture(rule="{self.direction}")
def direction(m):
    return m.direction
