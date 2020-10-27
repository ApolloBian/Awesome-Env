#!/usr/bin/env python3
import sys

fgs = [
    "39",
    "30", "1;30",
    "31", "1;31",
    "32", "1;32",
    "33", "1;33",
    "34", "1;34",
    "35", "1;35",
    "36", "1;36",
    "37", "1;37",
]
bgs = ["49", "40", "41", "42", "43", "44", "45", "46", "47"]
text = " *** "


# header
sys.stdout.write("%4s │ "% "")
for bg in bgs:
    sys.stdout.write(" %-4s "% bg)
sys.stdout.write('\n')

for i in range(5):
    sys.stdout.write('─')
sys.stdout.write('┼')
for i in range(len(bgs) * (len(text)+1)):
    sys.stdout.write('─')
sys.stdout.write('\n')

for fg in fgs:
    sys.stdout.write(f"{fg:>4s} │ ")
    for bg in bgs:
        sys.stdout.write(f"\x1b[{bg}m\x1b[{fg}m{text}\x1b[0m ")
    sys.stdout.write('\n')
