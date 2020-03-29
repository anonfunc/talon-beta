import re

from typing import Callable, Tuple

jargon = {
  "integer": "int",
  "bite": "byte",
  "bites": "bytes",
  "constant": "const",
  "context": "ctx",
  "define": "def",
  "format": "fmt",
  "funk": "func",
  "jason": "json",
  "no": "nil",
  "octa": "okta",
  "struck": "struct",
  "command": "cmd",
  "temp": "tmp",
  "module": "mod",
  "initialized": "init",
  "initialize": "init",
  "Annette": "init",
  "cloud": "cfn",
  "llama": "yaml",
  "unsigned": "u",
  "weight": "wait",
  "strength": "string",
  "air": "err",
  "the attacks": "mutex"
}

ACRONYM = (True, lambda i, word, _: word[0:1].upper())
FIRST_THREE = (True, lambda i, word, _: word[0:3])
FIRST_FOUR = (True, lambda i, word, _: word[0:4])
DUNDER = (
    True,
    lambda i, word, last: ("__%s" % word if i == 0 else word) + ("__" if last else ""),
)
CAMELCASE = (True, lambda i, word, _: word if i == 0 else word.capitalize())
SLASH_SEPARATED = (True, lambda i, word, _: "/" + word)
DOT_SEPARATED = (True, lambda i, word, _: word if i == 0 else "." + word)
GOLANG_PRIVATE = (
    True,
    lambda i, word, _: word.lower()
    if i == 0
    else word
    if word.upper() == word
    else word.capitalize(),
)
GOLANG_PUBLIC = (
    True,
    lambda i, word, _: word if word.upper() == word else word.capitalize(),
)
DOT_STUB = (True, lambda i, word, _: "." + word[:1] if i == 0 else word.capitalize()[:1])
SLICE = (True, lambda i, word, _: " []" + word if i == 0 else word)
NO_SPACES = (True, lambda i, word, _: word.replace("-", ""))
DASH_SEPARATED = (True, lambda i, word, _: word if i == 0 else "-" + word)
DOWNSCORE_SEPARATED = (True, lambda i, word, _: word if i == 0 else "_" + word)
LOWSMASH = (True, lambda i, word, _: word.lower())
SENTENCE = (False, lambda i, word, _: word.capitalize() if i == 0 else word)
JARGON = (False, lambda i, word, _: jargon.get(word.lower(), word))


def surround(by):
    def func(i, w, last):
        if i == 0:
            w = by + w
        if last:
            w += by
        return w

    return func


def normalize(identifier):
    # https://stackoverflow.com/questions/29916065/how-to-do-camelcase-split-in-python
    return re.sub(
        r"[-_]", " ", re.sub("(?!^| )([A-Z0-9][a-z0-9]+)", r" \1", identifier)
    )


named_formatters = {
    # Smashed
    "acronym": ACRONYM,
    "tree": FIRST_THREE,
    "quad": FIRST_FOUR,
    "dunder": DUNDER,
    "camel": GOLANG_PRIVATE,
    "slashed": SLASH_SEPARATED,
    # Golang private/public conventions prefer SendHTML to SendHtml sendHtml
    # TODO: Consider making these the "camel" impl, pep8 prefers it as well.
    # "private": GOLANG_PRIVATE,
    "upper": GOLANG_PUBLIC,
    # "slice": SLICE,
    # Call method: for driving jetbrains style fuzzy Complete -> .fuzCom
    "invoke": DOT_STUB,
    "snake": DOWNSCORE_SEPARATED,
    "smash": NO_SPACES,
    "spine": DASH_SEPARATED,
    # Spaced
    # "sentence": SENTENCE,
    "jargon": JARGON,
    "title": (False, lambda i, word, _: word.capitalize()),
    "allcaps": (False, lambda i, word, _: word.upper()),
    "lowcaps": (False, lambda i, word, _: word.lower()),
    "phrase": (False, lambda i, word, _: word),
    "bold": (False, surround("*")),
    "quoted": (False, surround('"')),
    "ticked": (False, surround("'")),
    "glitched": (False, surround("`")),
    "padded": (False, surround(" ")),
    "pad": (False, lambda i, word, _: " " + word if i == 0 else word),
    "parens": (
        False,
        lambda i, word, last: ("(%s" % word if i == 0 else word)
                              + (")" if last else ""),
    ),
}


# TODO: Can I make this part of format_text? Or reuse extract_formatter_and_words?
def formatted_text(phrase, *formatters) -> str:
    tmp = []
    spaces = True
    words = phrase.split()
    for i, word in enumerate(words):
        for formatter in reversed(formatters):
            smash, func = formatter
            word = func(i, word, i == len(words) - 1)
            spaces = spaces and not smash
        tmp.append(word)
    words = tmp

    sep = " "
    if not spaces:
        sep = ""
    return sep.join(words)
#
#
# def format_text(m: list) -> str:
#     fmt, words = extract_formatter_and_words(m)
#     tmp = []
#     spaces = True
#     for i, word in enumerate(words):
#         for name in reversed(fmt):
#             smash, func = named_formatters[name]
#             word = func(i, word, i == len(words) - 1)
#             spaces = spaces and not smash
#         tmp.append(word)
#     words = tmp
#
#     sep = " "
#     if not spaces:
#         sep = ""
#
#     return sep.join(words)
#
#
# def extract_formatter_and_words(m: list) -> Tuple[list, list]:
#     fmt = []
#     # noinspection PyProtectedMember
#     for w in m:
#         # noinspection PyUnresolvedReferences
#         if isinstance(w, Word) and parse_word(w.word) != "over":
#             # noinspection PyUnresolvedReferences
#             fmt.append(w.word)
#     words = [a for w in m for a in normalize(w).split()]
#     # print(words)
#     # if not words:
#     #     with clip.capture() as s:
#     #         press("cmd-c", wait=2000)
#     #     try:
#     #         words = normalize(s.get()).split()
#     #     except clip.NoChange:
#     #         words = []
#     # if not words:
#     #     words = [""]
#     return fmt, words


def sponge_format(words: list) -> str:
    dictation = " ".join(words)
    result = []
    caps = True
    for c in dictation:
        if c == " ":
            result.append(c)
            continue
        result.append(c.upper() if caps else c.lower())
        caps = not caps
    return "".join(result)


def replace_jargon(phrase: list) -> list:
    global jargon
    return [jargon.get(word.lower(), word) for word in phrase]