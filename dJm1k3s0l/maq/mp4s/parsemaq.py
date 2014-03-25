import subprocess

def gulp(infi) :
  foo = file(infi,'r')
  out = foo.read()
  foo.close()
  return out

maq = [y.split('"')[1] for y in list(set(list(filter(lambda x : ("-->" in x) and ("error" not in x), gulp('maq.txt').split('\n')))))]
maq.remove('http://www.youtube.com/user/Julielovesmac07/videos')

for x in maq :
  print "DOING", x
  subprocess.call('youtube-dl "{0}"'.format(x), shell=True)
