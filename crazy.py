import random
import string
from midiutil.MidiFile import MIDIFile

SIXTEENTH = 0.25
THIRTY_SECOND = 0.125
HALF = 0.50

class Rule(object) :
  @staticmethod
  def constructor(self, l) :
    pass
  @staticmethod
  def analysis(self,l) :
    pass

class Instrument(object) :
  rules = []
  def __init__(self, track, channel, pitch, name) :
    self.track = track
    self.channel = channel
    self.pitch = pitch
    self.name = name
  def add_track(self, m) :
    m.addTrackName(self.track,0,self.name)
  def make(self) :
    pass
  def make_midi(self) :
    pass

class AutomatedInstrument(Instrument) :
  def make(self) :
    screwed = True
    out = [0]*16
    while screwed :
      screwed = False
      out = [0]*16
      for rule in self.rules :
        out = rule.constructor(out)
      for rule in self.rules :
        if not rule.analysis(out) :
          screwed = True
          break
    return out

class ParsingInstrument(Instrument) :
  '''
  Form: x---x__-s_----d-
  x default is 100
  l is 120
  m is 80
  s is 50
  d is 2 32nd notes
  '''
  def __init__(self, track, channel, pitch=36, name="Bass", music="", factor = 1.0) :
    Instrument.__init__(self, track, channel, pitch, name)
    self.music = string.lower(music)
    self.factor = factor
  def make(self) :
    ticker = 0
    out = []
    for x in range(len(self.music)) :
      if self.music[x] == 'x' :
        out.append((ticker, 100, SIXTEENTH))
      elif self.music[x] == 'd' :
        #print out
        out.append((ticker, 100, THIRTY_SECOND))
        out.append((ticker + THIRTY_SECOND, 100, THIRTY_SECOND))
      elif self.music[x] == '-' :
        pass
      elif self.music[x] == '_' :
        out[-1] = out[-1][:2] + (out[-1][2]+SIXTEENTH,)
      elif self.music[x] in 'lms' :
        out.append((ticker, {'l':120, 'm':80, 's':50}[self.music[x]], SIXTEENTH))
      else :
        raise ValueError(self.music[x])
      ticker += SIXTEENTH
    return out
  def make_midi(self, m) :
    out = self.make()
    for x in range(len(out)) :
      m.addNote(self.track,self.channel,self.pitch,out[x][0] * self.factor,out[x][2] * self.factor, out[x][1])

class Bass1(Rule) :
  @staticmethod
  def constructor(l):
    return [1]+l[1:]
  @staticmethod
  def analysis(l) :
    return l[0] == 1

class BassB2B(Rule) :
  @staticmethod
  def constructor(l):
    idx = random.randint(2,13)
    return l[:idx] + [1,1] + l[idx+2:]
  @staticmethod
  def analysis(l) :
    b2b = 0
    for x in range(len(l) - 1) :
      if (l[x] + l[x+1]) == 2 :
        b2b += 1
    return b2b == 1

class Bass328(Rule) :
  @staticmethod
  def constructor(l):
    n = random.choice([3,3,4,4,4,5,5,5,5,6,6,6,7,7,8])
    if n == 3 :
      l = [l[0]]+([0]*15)
    for x in range(n - sum(l)) :
      possibles = []
      for y in range(1, len(l)-1) :
        if (l[y-1] == 0) & (l[y+1] == 0) :
          possibles.append(y)
      if (len(possibles)) :
        random.shuffle(possibles)
        l[possibles[0]] = 1
    return l
  @staticmethod
  def analysis(l) :
    return (sum(l) >= 5) & (sum(l) <= 8)

class Bass(AutomatedInstrument) :
  rules = [Bass1, BassB2B, Bass328]
  def __init__(self, track, channel, pitch=36, name="Bass") :
    AutomatedInstrument.__init__(self, track, channel, pitch, name)
  # make is in constructor
  def make_midi(self, m) :
    out = self.make()
    for x in range(len(out)) :
      if (out[x]) :
        pickup = (x == 15) | ((out+[1])[x+1] == 1) # ugh, stupid python or
        duration = SIXTEENTH if pickup else HALF
        volume = 90 if pickup else 110
        m.addNote(self.track,self.channel,self.pitch, x/4.0 ,duration,volume)

class HiHatCFlange(Rule) :
  @staticmethod
  def constructor(l):
    okidx = [2,3,5,6,7,9,10,11,13,14]
    idx = random.choice(okidx)
    return l[:idx]+[2,2]+l[idx+2:]
  @staticmethod
  def analysis(l) :
    for x in range(len(l)) :
      if (l[x] == 2) & (x < len(l)-1) :
        return l[x+1] == 2
    return False

class HiHatCHits(Rule) :
  # copied a bit from bass rule
  @staticmethod
  def constructor(l):
    for x in range(random.randint(1,3)) :
      okidx = range(1,15)
      possibles = []
      for y in range(1, len(l)-1) :
        if (l[y-1] == 0) & (l[y+1] == 0) :
          possibles.append(y)
      if (len(possibles)) :
        random.shuffle(possibles)
        l[possibles[0]] = 1
    return l
  @staticmethod
  def analysis(l) :
    return len(filter(lambda x : x > 0,l)) in [3,4,5]

class HiHatC(AutomatedInstrument) :
  rules = [HiHatCFlange, HiHatCHits]
  def __init__(self, track, channel, pitch=36+6, name="HiHatC") :
    AutomatedInstrument.__init__(self, track, channel, pitch, name)
  # make is in constructor
  def make_midi(self, m) :
    out = self.make()
    for x in range(len(out)) :
      if (out[x]) :
        pickup = (out[x] == 2)
        duration = THIRTY_SECOND if pickup else HALF
        volume = 90 if pickup else 110
        m.addNote(self.track,self.channel,self.pitch, x/4.0 ,duration,volume)
        if out[x] == 2 :
          m.addNote(self.track,self.channel,self.pitch, x/4.0 + THIRTY_SECOND,duration,volume)

# Create the MIDIFile Object with 1 track
MyMIDI = MIDIFile(2)
MyMIDI.addTempo(0,0,120)
'''
bass = Bass(0,0)
bass.add_track(MyMIDI)
bass.make_midi(MyMIDI)

hihat = HiHatC(0,1)
hihat.add_track(MyMIDI)
hihat.make_midi(MyMIDI)

snare = ParsingInstrument(0,2,36+2,"Snare","--x_--m---d---d-")
snare.add_track(MyMIDI)
snare.make_midi(MyMIDI)
'''

#7th in les Amants11
tracks = {
  42 : "xxddxxxxxxd--d-xxxddxx-x-x--xx-x",
  41 : "x--xx-x----x-x-xxx-x-x-xx--x-x-x",
  40 : "---x---x----x-x-----x--x---x--x-",
  47 : "--x--x--x--x--x--x--x--x--x--x--",
  49 : "--------------------x-----x---x-",
  50 : "x-x--xxx----x---xxx--------x----",
  37 : "----------x-x-x------------x----"
}

#8th, factor 4/3.
'''
tracks = {
  37 : "x-----------------------",
  36 : "x----xx-----x----xx-----",
  38 : "------x-----------x-----",
  39 : "---x-----x-----x-----x--",
  42 : "xddxxxx-xxxxxddxxxx---xx",
  44 : "--x-x--------------x-x--",
  47 : "x-x----x--x---x------x--",
  50 : "-------------------xxxxx",
  48 : "x---------------------xx"
}

### FULL LIFE CONSEQUENCES

tracks = {
  36 : "x"*16,
  37 : "x"*16,
  38 : "x"*16,
  39 : "x"*16,
  40 : "x"*16,
  41 : "x"*16,
  42 : "x"*16,
  43 : "x"*16,
  44 : "x"*16,
  45 : "x"*16,
  46 : "x"*16,
  47 : "x"*16,
  48 : "x"*16,
  49 : "x"*16,
  50 : "x"*16,
  51 : "x"*16,
}
'''


count = 0
for key in tracks.keys() :
  foo = ParsingInstrument(0,count,key, "my{0}".format(key), tracks[key], factor=1.0)
  foo.add_track(MyMIDI)
  foo.make_midi(MyMIDI)
  count += 1

# And write it to disk.
binfile = open("overtimeDrumz.mid", 'wb')
MyMIDI.writeFile(binfile)
binfile.close()
