import subprocess
import os

a = os.listdir('.')
for x in a :
  if x[-3:] == 'wav' :
    subprocess.call("sox {0} trims/{0} silence 1 0.05 0.5%".format(x),shell=True)

