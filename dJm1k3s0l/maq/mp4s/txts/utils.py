# -*- coding: latin-1 -*-

import os

def gulp(infi) :
  foo = file(infi,'r')
  out = foo.read()
  foo.close()
  return out

FILES = filter(lambda x : x[-3:] == 'txt', os.listdir('.'))
TEXTS = [gulp(x) for x in FILES]
def find_word(w) :
  out = []
  for x in range(len(FILES)) :
    if w in TEXTS[x] :
      out.append(FILES[x])
  return out
