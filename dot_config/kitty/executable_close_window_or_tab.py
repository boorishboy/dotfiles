#!/usr/bin/env python3
"""Close the focused kitty window, or its tab when it is the only window."""

import json
import os
import subprocess
import sys


def main() -> int:
    result = subprocess.run(
        ["kitten", "@", "ls"],
        capture_output=True,
        text=True,
        check=False,
        close_fds=False,
    )
    if result.returncode:
        sys.stderr.write(result.stderr)
        return result.returncode

    try:
        os_windows = json.loads(result.stdout)
    except json.JSONDecodeError as error:
        sys.stderr.write(f"Could not read kitty window list: {error}\n")
        return 1

    current_window_id = os.environ.get("KITTY_WINDOW_ID")
    focused: tuple[dict, dict] | None = None
    for os_window in os_windows:
        for tab in os_window.get("tabs", []):
            for window in tab.get("windows", []):
                if window.get("is_self") or (
                    current_window_id is not None
                    and str(window.get("id")) == current_window_id
                ):
                    return close_target(tab, window)
                if window.get("is_focused"):
                    focused = (tab, window)

    if focused is not None:
        return close_target(*focused)

    sys.stderr.write("Could not find the focused kitty window.\n")
    return 1


def close_target(tab: dict, window: dict) -> int:
    if len(tab["windows"]) > 1:
        action = ["close-window", f"--match=id:{window['id']}"]
    else:
        action = ["close-tab", f"--match=id:{tab['id']}"]
    close = subprocess.run(
        ["kitten", "@", *action],
        capture_output=True,
        text=True,
        check=False,
        close_fds=False,
    )
    return close.returncode


if __name__ == "__main__":
    raise SystemExit(main())
