import sys
import json

json.dump({
    "results": [
        {"check_id": v["code"], "path": k, "extra": {"output": v}}
        for k, v in json.load(sys.stdin).items() if v
    ]
}, sys.stdout)
