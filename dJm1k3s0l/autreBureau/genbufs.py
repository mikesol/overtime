import os

DIRS = '''quiVeutDuCafe
jenAiDeja
augmentation
oui
conversation
caTeDit
resterTravailler
moiAussi'''.split('\n')

for dir in DIRS :
  dirlist = os.listdir(dir)
  for element in dirlist :
    print "~{2}_{0} = Buffer.read(s,\"{1}\");".format(element[:-4], os.path.join(os.getcwd(),dir,element), dir)
  print "~{0} = [".format(dir)
  for element in dirlist :
    print "~{1}_{0},".format(element[:-4], dir)
  print "];"
