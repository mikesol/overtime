from pymidi import *
import time
import random

m = MidiIO()

N = 16
LO = 36

for x in range(N) :
  note = x + LO
  print note
  m.noteOn(note)
  time.sleep(1)
  m.noteOff(note)
  time.sleep(0.1)

