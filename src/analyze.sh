#!/bin/bash

set -eux

CODE_DIR="/analysis/inputs/public/source-code"
OUTPUT_FILE="/analysis/output/output.json"
RULES="DUO"

RESULTS=$(flake8 --select=$RULES --format=json --exit-zero $CODE_DIR)
SCHEMA_RESULTS=$(echo -n $RESULTS | python schema.py)

echo $SCHEMA_RESULTS > $OUTPUT_FILE
