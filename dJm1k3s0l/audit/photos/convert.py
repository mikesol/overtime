import subprocess
import os

o = filter(lambda x : x[-3:] in 'jpg png gif'.split(' '), os.listdir('.'))

outfi = file('mapping.txt','w')

for x in range(len(o)) :
  subprocess.call('convert "{0}" -transparent white transparents/{1}.png'.format(o[x], x), shell=True)
  outfi.write(o[x]+'\n')
  outfi.write('{0}.png\n'.format(x))

outfi.close()