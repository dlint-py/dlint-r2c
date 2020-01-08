import sys
import json
import os


if len(sys.argv) == 2:
    # Remove code directory from output, e.g.
    # /analysis/inputs/public/source-code/path/to/code.py -> path/to/code.py
    base_path = sys.argv[1]
    path = lambda p: os.path.relpath(p, base_path)
else:
    path = lambda p: p

json.dump({
    "results": [
        {"check_id": "dlint", "path": path(k), "extra": {"output": v}}
        for k, v in json.load(sys.stdin).items() if v
    ]
}, sys.stdout)
