import os
import hashlib
import md5

def remove_duplicates(dir):
  unique = []
  for filename in os.listdir(dir):
    if os.path.isfile(filename):
      filehash = md5.md5(file(filename).read()).hexdigest()
    if filehash not in unique: 
      unique.append(filehash)
    else:
      print "REMOVING", filename
      #os.remove(filename)

remove_duplicates('.')