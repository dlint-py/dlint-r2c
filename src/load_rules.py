import json
import sys


filename = sys.argv[1]
default = sys.argv[2]

try:
    parameters = json.load(open(filename))
except FileNotFoundError:
    print(default)
else:
    print(parameters.get("rules", default))
