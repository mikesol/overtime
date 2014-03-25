# -*- coding: latin-1 -*-

import sys
import subprocess
from utils import *

FILES = find_word(sys.argv[1])

KEEPERS = []

print len(FILES), "à auditionner, à savoir..."
for FILE in FILES :
  print "  ", FILE

for x in range(len(FILES)) :
  FILE = FILES[x]
  print "now on FILE:", FILE, "({0} sur {1})".format(x + 1, len(FILES))
  goods = '.'.join(FILE.split('.')[:-1]).split('-')
  goods[1] = float(goods[1])
  goods[2] = float(goods[2])
  p = subprocess.Popen('ffplay -autoexit -ss {0} -t {1} ../{2}.mp4'.format(goods[1], goods[2] - goods[1], goods[0]), shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
  ri = raw_input("Keep? [Y/n]: ")
  if ri != 'n' :
    KEEPERS.append(FILE)
    p.kill()
  else :
    p.kill()

for x in KEEPERS :
  print x