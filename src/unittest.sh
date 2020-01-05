#!/bin/bash

set -eux

python -m flake8 --help | grep -q dlint
