#!/bin/bash

set -eux

CODE_DIR="/analysis/inputs/public/source-code"
OUTPUT_FILE="/analysis/output/output.json"
RULES="DUO"

RESULTS=$(flake8 --select=$RULES --format=json --exit-zero $CODE_DIR)
SCHEMA_RESULTS=$(echo -n $RESULTS | python -c 'import sys, json; print(json.dumps({"results": [{"check_id": "dlint", "path": k, "extra": {"output": v}} for k, v in json.load(sys.stdin).items() if v]}))')

echo $SCHEMA_RESULTS > $OUTPUT_FILE
