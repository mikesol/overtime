import subprocess
import os
import sys

base = '/Users/mikesolomon/Documents/Compositions/overtime'
dj = os.path.join(base,'dJm1k3s0l')
def join(x,y) :
  return os.path.join(x,y)

def make_thingee(BIG, path) :
  for x in BIG :
    if not os.path.exists(x[0]) :
      print x[0]
      raise ValueError
    #subprocess.call('soxi {0}'.format(x[0]), shell=True)

  #sys.exit(1)

  for x in range(len(BIG)) :
    uberthen = 'uber{0}.aif'.format(x % 2)
    ubernow = 'uber{0}.aif'.format((x + 1) % 2)
    command = ''
    if len(BIG) == 1 :
      command = 'sox {0} {1}'.format(BIG[x][0], path)
    elif x < len(BIG) - 1 :
      if BIG[x][1] > 0 :
        command = 'sox -n -r 44100 -c 2 silence.aif trim 0.0 {0} && '.format(BIG[x][1])
        command += 'sox {0} silence.aif temp.aif '.format(BIG[x][0])
      else :
        command = 'sox {0} temp.aif '.format(BIG[x][0])
      if x != 0 :
        command += ' && sox {0} temp.aif {1}'.format(uberthen, ubernow)
      else :
        command += ' && sox temp.aif {0}'.format(ubernow)
    else :
      command = 'sox {0} {1} {2}'.format(uberthen, BIG[x][0], path)
    print command
    subprocess.call(command, shell=True)

'''  
foo = [
[join(dj,'overtime/overtime/Bounces/overtimeConcertVersion2.aif'),6.5],
[join(dj,'welcome/leaderExSketch/Bounces/leaderExFinal.aif'),1],
[join(base, 'lePatronPart/Bounces/lePatronPartSansVoix.aif'), 1.5],
['/Applications/SuperCollider/peuplent/peuplentTest16.aiff']
]

make_thingee(foo, 'runtime/pedale1.aif')

# pedale 2 ends thing

foo = [
[join(dj, 'bruit/bruitConcertVersion/Bounces/leBruitWithoutMike.aif')],
]

make_thingee(foo, 'runtime/pedale3.aif')

foo = [
[join(base, 'blague5/Bounces/mahlerEND.aif'), 1.3],
[join(dj, 'ami/ugly/Bounces/lAmiLaidPRACTICE.aif'),2],
[join(dj, 'candidature/candidature/Bounces/candidatureFINAL.aif'),6],
[join(dj, 'pigeon/unPigeonDansLeBureau/Bounces/unPigeonDansLeBureauClean.aif')]
]

make_thingee(foo, 'runtime/pedale4.aif')
# pedal 5 les amants 2
# pedal 6 ends les amants 2 and brings the cleaning lady slide
# pedal 7 begins the cleaning lady

foo = [
[join(dj, 'menage/theCleaningLadyConcertVersion.aif')],
]

make_thingee(foo, 'runtime/pedale7.aif')

foo = [
[join(base, 'english/Bounces/englishEndPart.aif'),14],
[join(base, 'sounds/80997__payattention__ding.aif')]
]

make_thingee(foo, 'runtime/pedale8.aif')
'''
foo = [
[join(base, 'sounds/80997__payattention__ding.aif'), 15],
[join(dj, 'audit/SPECIAL/sketch/Bounces/auditConcertVersion.aif'),14.5],
[join(dj,'plusDeBlanco/sketch/Bounces/plusDeBlancoConcertVersion.aif'),2.5],
[join(dj,'autreBureau/autreBureau/Bounces/autreBureauFirstAttempt.aif'),40],
[join(dj, 'licenciement/licenciement/Bounces/licenciementConcertVersion.aif'),26],
[join(dj, 'amants3/mockup/Bounces/lesAmants3ConcertVersion.aif'),0], # should be 0
[join(dj, 'screen/screen/Bounces/screen.aif'),2.8], # should be 0
[join(dj, 'lux/coupureDeCourantSansVoix.aif'),10],
[join(dj, 'laFinDuMonde/yeah/Bounces/cdmConcertVersion.aif'),4],
[join(dj, 'amants3/firstLimited.aif')]
]
  
make_thingee(foo, 'runtime/pedale9.aif')
