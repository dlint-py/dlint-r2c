import json
import os
import sys


# Remove code directory from output, e.g.
# /analysis/inputs/public/source-code/path/to/code.py -> path/to/code.py
base_path = sys.argv[1]

json.dump({
    "results": [
        {
            "check_id": finding["code"],
            "path": os.path.relpath(path, base_path),
            "start": {
                "line": finding["line_number"],
                "col": finding["column_number"]
            },
            "extra": finding
        }
        for path, findings in json.load(sys.stdin).items() if findings
        for finding in findings
    ]
}, sys.stdout)
