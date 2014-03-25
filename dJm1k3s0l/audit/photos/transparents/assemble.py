import random
import subprocess

DURATION = 138
NFILES = 345
FRATE = 28
#****

TIMES = sorted([random.random()*DURATION for x in range(NFILES)])
XPOS = [random.randint(-960,960) for x in range(NFILES)]
YPOS = [random.randint(-540,540) for x in range(NFILES)]
XRATES = [random.choice([-2,-1,0,1,2]) for x in range(NFILES)]
YRATES = [random.choice([-2,-1,0,1,2]) for x in range(NFILES)]
HEAD = "convert -size 1920x1080 xc:white"
COMMAND = "{0}.png -gravity CENTER -geometry {1:+d}{2:+d} -composite"
TAIL = "frames/{0:05d}.png"


for x in range(int(FRATE*DURATION)) :
  call_me = [HEAD]
  for y in range(NFILES) :
    if x * 1.0 / FRATE > TIMES[y] :
      call_me += [COMMAND.format(y, XPOS[y], YPOS[y])]
      XPOS[y] += XRATES[y]
      YPOS[y] += YRATES[y]
  call_me += [TAIL.format(x)] 
  TO_CALL = ' '.join(call_me)
  #print TO_CALL
  print x, "of", FRATE*DURATION
  subprocess.call(TO_CALL, shell=True)
