#!/bin/bash

set -eux

CODE_DIR="/analysis/inputs/public/source-code"
PARAMETERS_FILE="/analysis/inputs/parameters.json"
OUTPUT_FILE="/analysis/output/output.json"

RULES=$(python /analyzer/load_rules.py $PARAMETERS_FILE "DUO")
RESULTS=$(flake8 --select=$RULES --format=json --exit-zero $CODE_DIR)
SCHEMA_RESULTS=$(echo -n $RESULTS | python /analyzer/schema.py $CODE_DIR)

echo $SCHEMA_RESULTS > $OUTPUT_FILE
