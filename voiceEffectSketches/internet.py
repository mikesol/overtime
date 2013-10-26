import subprocess
import os

a = os.listdir('.')
for x in a :
  if x[-3:] == 'wav' :
    print "http://www.ensemble101.fr/overtime/sketches/voice-26-06-13/{0}".format(x)

