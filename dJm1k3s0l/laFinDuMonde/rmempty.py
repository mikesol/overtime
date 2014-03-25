import subprocess
import sys
import os

for i in range(40) :
  for j in range(40) :
    proc = subprocess.Popen('sox glitch/glitch-{0}-{1}.aiff -n stat'.format(i,j), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    proc.wait()
    stderr = proc.stderr.read()
    info = [abs(float(z[-1])) for z in [y.split(' ') for y in filter(lambda x : ('Minimum amplitude' in x) or ('Maximum amplitude' in x), stderr.split('\n'))]]
    if ((len(info) < 1) or ((info[0] < 0.2) and (info[1] < 0.2))) :
      os.remove('glitch/glitch-{0}-{1}.aiff'.format(i,j))
      