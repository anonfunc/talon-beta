from typing import Any, Dict


# Using lists instead of building an alternating group causes parser timeouts!
def as_rule(d: Dict[str, Any]) -> str:
    """Transforms the keys of a dictionary into a capturing rule.

    >>> as_rule({"a": 0, "b": 1})
    '(a | b)+'

    """
    return f"({' | '.join(d.keys())})+"


if __name__ == "__main__":
    import doctest

    doctest.testmod()
