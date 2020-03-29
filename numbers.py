digits_map = dict(zip(
    "zero one two three four five six seven eight nine".split(),
    range(10)))

numeral_map = {**digits_map}
numeral_map.update(dict(zip(
    "ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen".split(),
    range(10, 20))))
numeral_map.update(
    dict(zip("twenty thirty forty fifty sixty seventy eighty ninety".split(), range(20, 101, 10))))
small_numeral_map = {**numeral_map}

factors = {"hundred": 100, "oh": 100, "thousand": 1000}
numeral_map.update(factors)
numeral_map.update({"and": None})


def words_to_numerals(words: list) -> str:
    """Convert a list of words into a numeric representation.

    Based on https://stackoverflow.com/questions/70161/how-to-read-values-from-numbers-written-as-words
    with modifications to handle 'one ten' as 110.

    >>> words_to_numerals(["one", "ten"])
    '110'

    >>> words_to_numerals(["one", "hundred"])
    '100'

    >>> words_to_numerals(["one", "hundred", "and", "one"])
    '101'

    >>> words_to_numerals(["two", "oh", "one"])
    '201'

    >>> words_to_numerals(["ten", "twenty", "four"])
    '1024'

    >>> words_to_numerals(["one", "thousand", "twenty", "four"])
    '1024'
    """
    # print(words)
    words = [w.lower() for w in words]

    total = 0
    prior = None
    for w in words:
        if w not in numeral_map:
            raise Exception("not a number: {}".format(words))
        v = numeral_map[w]
        # print(f"{total} {prior} {w} {v}")

        if not v:
            continue

        if prior is None:
            prior = v
        elif prior > v:
            prior += v
        elif w not in factors:
            prior *= 10 ** len(str(v))
            prior += v

        if w in factors:
            prior *= v
            total = total + prior
            prior = None
    # print(f"{total} {prior} {w} {v}")
    if prior is not None:
        total = total + prior
    # print(f"{total} {prior} {w} {v}")
    return str(total)


if __name__ == "__main__":
    import doctest

    doctest.testmod()
