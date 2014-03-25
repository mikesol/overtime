import sys
import math
import os
import subprocess

SQUARE = 11**2
#SQUARE = 3**2

INPUTS = filter(lambda x : (x[-4:] == '.mp4') & (x[:4] == 'smaq'), os.listdir('.'))
#INPUTS = filter(lambda x : (x[-4:] == '.mp4') & (x[:4] == 'smaq'), os.listdir('.'))[:64]

if math.sqrt(len(INPUTS)) != int(math.sqrt(len(INPUTS))) :
  sys.exit(1)

SQRT = int(math.sqrt(len(INPUTS)))

'''
OUT = ["ffmpeg"]
for x in INPUTS :
  OUT += ["-i {0}".format(x)]

OUT += ["-filter_complex"]

OUT += ["\"[0:v]pad=iw*{0}:ih*{0}[o0];".format(SQRT)]

for x in range(1,len(INPUTS)) :
  OUT += ["[o{0}][{1}:v]overlay=x=w*{2}:y=h*{3}:shortest=1[o{1}];".format(x - 1, x, x / SQRT, x % SQRT)]

OUT += ["[o{0}]scale=iw:ih[out]\"".format(len(INPUTS) -1)]
OUT += ["-map \"[out]\" Output.mp4"]

print ' '.join(OUT)
'''
ALL = []
for x in range(len(INPUTS)) :
  if x == 0 :
    OUT = ["ffmpeg"]
    OUT += ["-i {0} -vf".format(INPUTS[x])]
    OUT += ["\"pad=iw*{0}:ih*{0}\"".format(SQRT)]
    OUT += ["v{0}.mp4".format(x)]
    ALL += [' '.join(OUT)]
  else :
    OUT = ["ffmpeg"]
    OUT += ["-i v{0}.mp4 -i {1}".format(x - 1, INPUTS[x])]
    OUT += ["-filter_complex"]
    OUT += ["\"[0:v][1:v]overlay=x=w*{0}/{2}:y=h*{1}/{2}:shortest=1\"".format(x / SQRT, x % SQRT, 1)]
    OUT += ["v{0}.mp4".format(x)]
    ALL += [' '.join(OUT)]
    ALL += ['rm v{0}.mp4'.format(x - 1)]

for x in ALL :
  print x
  #subprocess.call(x, shell=True)
