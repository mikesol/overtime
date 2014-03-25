import sys
import math
import os
import subprocess

SQUARE = 11**2
#SQUARE = 3**2

DIR = filter(lambda x : (x[-4:] == '.mp4') & (x[:3] == 'maq'), os.listdir('.'))

def is_1280x720_and_over_1m(x) :
  p = subprocess.Popen('ffmpeg -i {0}'.format(x), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  p.wait()
  full = p.stderr.read()
  res = '1280x720' in full
  #print full.split('Duration: ')[1].split(',')[0]
  dur = int(full.split('Duration: ')[1].split(',')[0][3:5]) > 1
  return (res and dur)

DIR = filter(is_1280x720_and_over_1m, DIR)

for x in DIR :
  print x

sys.exit(1)

INPUTS = DIR[:SQUARE]

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
for x in INPUTS :
  OUT = ["ffmpeg"]
  OUT += ["-i {0} -vf".format(x)]
  OUT += ["\"scale=iw/{0}:trunc(ow/a/2)*2\"".format(SQRT)]
  OUT += ["{0}".format('s'+x)]
  #print ' '.join(OUT)
  #subprocess.call(' '.join(OUT), shell=True)

#print ' '.join(OUT)
'''
