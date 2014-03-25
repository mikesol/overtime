# -*- coding: ascii -*-
import os
import subprocess

a = filter(lambda x : x[-3:] == 'mp4', os.listdir('.'))
#out = file('links.txt','w')
for x in range(len(a)) :
  FROM = a[x]
  TO = 'maq{0}.mp4'.format(str(x).rjust(3, '0'))
  os.rename(FROM, TO)

#out.close()