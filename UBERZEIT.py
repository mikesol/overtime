import subprocess
import os
import sys

base = '/Users/mikesolomon/Documents/Compositions/overtime'
dj = os.path.join(base,'dJm1k3s0l')
def join(x,y) :
  return os.path.join(x,y)

BIG = [
#[join(dj,'overtime/overtime/Bounces/overtimeFULL.aif'),6.5],
[join(dj,'overtime/overtime/Bounces/overtimeConcertVersion2.aif'),6.5],
[join(dj,'welcome/leaderExSketch/Bounces/leaderExSketch.aif'),1],
#[join(base, 'lePatronPart/Bounces/lePatronPartAvecVoix.aif'), 3],
[join(base, 'lePatronPart/Bounces/lePatronPartSansVoix.aif'), 3],
#[join(dj, 'lePatronRevient/lePatronRevient/Bounces/lePatronRevient.aif'),1.5],
['/Applications/SuperCollider/peuplent/peuplentTest16.aiff',1.5],
[join(base, 'lesAmants/Bounces/lesAmants.aif'), 5.5],
[join(dj, 'bruit/bruitConcertVersion/Bounces/leBruitConcertVersion.aif'), 2],
[join(base, 'blague5/Bounces/finals/laBlagueNoTail.aif'), 0],
[join(dj, 'ami/ugly/Bounces/lAmiLaid.aif'),2],
[join(dj, 'candidature/retarted/Bounces/stupidJoke.aif'),0],
[join(dj, 'pigeon/unPigeonDansLeBureau/Bounces/unPigeonDansLeBureau2.aif'), 1.2],
[join(dj, 'amants2/moreManly8.aif'),3],
##### TWO for the cleaning lady,
[join(dj, 'menage/broom.aif'), 4],
[join(dj, 'menage/theCleaningLadyConcertVersion.aif'),0.3],
[join(base, 'english/Bounces/lAnglais4NoTail.aif'),0],
[join(dj, 'ascenseur/ascenseur/Bounces/ascenseurMIXED.aif'),0],
[join(dj, 'audit/SPECIAL/sketch/Bounces/auditSketch.aif'),2.5],
[join(dj,'plusDeBlanco/sketch/Bounces/plusDeBlancoMockup.aif'),2.5],
[join(dj,'autreBureau/autreBureau/Bounces/autreBureauFirstAttempt.aif'),0],
# need an evolution in the EA on the voice...
[join(dj, 'licenciement/licenciementWIthIntro.aif'),4],
[join(dj, 'amants3/mockup/Bounces/lesAmants3Mockup.aif'),240], # should be 0
# ridicule here
[join(dj, 'lux/coupureDeCourant.aiff')]
# finale here
]

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
  if x < len(BIG) - 1 :
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
    command = 'sox {0} {1} uberzeit.aif'.format(uberthen, BIG[x][0], ubernow)
  print command
  subprocess.call(command, shell=True)