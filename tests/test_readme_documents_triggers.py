"""Regression test for REVIEW.md's "README.md doesn't mention the leaderboard
(or several other live systems)" finding.

generate.py's LB_METRICS and SMITE_PLAYERS lists are the source of truth for
which `/trigger` commands actually exist in the datapack. Nothing previously
caught the case where a metric or smite/immortal/mortal player is added to
generate.py but the README isn't updated to document it — this test closes
that gap with a static source scan (no execution of generate.py, since it
writes datapack files as a side effect).
"""
import re
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
GENERATE_SRC = (REPO_ROOT / "generate.py").read_text()
README = (REPO_ROOT / "README.md").read_text()


def _lb_metric_keys():
    block = re.search(r"LB_METRICS = \[(.*?)\n\]", GENERATE_SRC, re.S)
    assert block, "couldn't find LB_METRICS in generate.py"
    return re.findall(r'\(\s*"(\w+)"', block.group(1))


def _smite_players():
    line = re.search(r"SMITE_PLAYERS = \[(.*?)\]", GENERATE_SRC)
    assert line, "couldn't find SMITE_PLAYERS in generate.py"
    return re.findall(r'"(\w+)"', line.group(1))


def test_readme_documents_every_leaderboard_metric():
    missing = [key for key in _lb_metric_keys() if f"/trigger {key}" not in README]
    assert not missing, (
        f"README.md is missing `/trigger <metric>` docs for: {missing} — "
        "add a row to the Leaderboard & Triggers table"
    )


def test_readme_documents_leaderboard_off_and_help_triggers():
    for cmd in ("/trigger off", "/trigger metric"):
        assert cmd in README, f"README.md is missing docs for `{cmd}`"


def test_readme_documents_anvil_trigger():
    assert "/trigger anvil" in README, "README.md is missing docs for `/trigger anvil`"


def test_readme_documents_smite_immortal_mortal_triggers():
    missing = [
        f"/trigger {prefix}_<player>"
        for prefix in ("smite", "immortal", "mortal")
        if f"/trigger {prefix}_<player>" not in README
    ]
    assert not missing, f"README.md is missing docs for: {missing}"
    for player in _smite_players():
        assert player in README, (
            f"README.md doesn't list '{player}' as a smite/immortal/mortal target"
        )
