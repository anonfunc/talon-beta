from typing import Any, Dict


# Using lists instead of building an alternating group causes parser timeouts!
def as_rule(d: Dict[str, Any]) -> str:
    """Transforms the keys of a dictionary into a capturing rule."""
    return f"({' | '.join(d.keys())})+"
