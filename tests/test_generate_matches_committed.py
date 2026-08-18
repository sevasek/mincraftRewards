"""Regression test for REVIEW.md's "no automated check that generate.py's
output matches what's committed" finding.

generate.py is the source of truth for most of data/ — every .mcfunction it
writes is meant to be regenerated and committed together. Nothing previously
caught the case where generate.py changes but the generated files aren't
re-committed (or vice versa), which is exactly the gap this test closes.
"""
import os
import subprocess
import sys
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent


def test_generated_output_matches_committed_files():
    with tempfile.TemporaryDirectory() as tmp:
        subprocess.run(
            [sys.executable, str(REPO_ROOT / "generate.py")],
            check=True,
            cwd=tmp,
            env={**os.environ, "REWARDS_GENERATE_ROOT": tmp},
        )

        mismatches = []
        for generated_file in Path(tmp).rglob("*"):
            if generated_file.is_dir():
                continue
            rel = generated_file.relative_to(tmp)
            committed_file = REPO_ROOT / rel
            if not committed_file.exists():
                mismatches.append(f"{rel}: generated but missing from the repo")
                continue
            if generated_file.read_text() != committed_file.read_text():
                mismatches.append(f"{rel}: differs from generate.py's output")

        assert not mismatches, (
            "generate.py's output no longer matches the committed files — "
            "run `python3 generate.py` and commit the result:\n"
            + "\n".join(mismatches)
        )
