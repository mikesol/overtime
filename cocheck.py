a = file('company.txt','r')
b = a.read()
a.close()
b = filter(lambda d : (len(d) > 4) & (d != 'Leaderex'), sum([c.split(' ') for c in b.split('\n')],[]))

for x in range(len(b) - 1) :
  for y in range(x + 1, len(b)) :
    if b[x][:4] == b[y][:4] :
      print x, y, b[x], b[y]