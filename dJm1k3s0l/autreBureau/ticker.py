import random
import string

def s_name() :
  out = ''
  for x in range(random.randint(3,4)) :
    out += random.choice(string.uppercase)
  return out

def s_price() :
  return '{0:+4.2f}'.format(random.random()*100-50)

OUT = []
for x in range(1000) :
  OUT += [s_name()]
  OUT += [s_price()]

print ' '.join(OUT)