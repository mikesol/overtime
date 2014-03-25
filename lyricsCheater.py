INFILE = 'scratch.txt'

def gulp(f) :
  infi = file(f,'r')
  out = infi.read()
  infi.close()
  return out


FI = [y.replace(' -- ', '') for y in filter(lambda x : x != '', gulp(INFILE).split('\n'))]

try :
  while True :
    FI.remove('')
except :
  pass


FI = [x.split(' ') for x in FI]

for x in range(len(FI)) :
  if '{' in FI[x] :
    FI[x].remove('{')
  if '}' in FI[x] :
    FI[x].remove('}')
  while '' in FI[x] :
    FI[x].remove('')
  if 'unfold' in FI[x] :
    ui = FI[x].index('unfold')
    n = int(FI[x][ui + 1])
    #FI[x] = FI[x][: ui - 1] + ( FI[x][ui + 2:] * n)
    #FI[x] = FI[x][: ui - 1] + ( FI[x][ui + 2:] * n) + ["({0} fois)".format(n)]
    FI[x] = FI[x][: ui - 1] + ( FI[x][ui + 2:] * 1) + ["({0} fois)".format(n)]

for line in FI :
  print ' '.join(line)
