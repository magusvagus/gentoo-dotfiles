#!/usr/bin/python
import subprocess as sub

volume = sub.getoutput(f"amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1")

vol = int(volume)
one = "^c#ffffff^"
two = "^c#cc3422^"
three = "^c#bb1212^"

if vol == 50:
    print(f"{one}{str(vol)}")

elif vol == 60:
    print(f"{two}{str(vol)}")

elif vol == 70:
    print(f"{three}{str(vol)}")
else:
    print(f"{str(vol)}")





