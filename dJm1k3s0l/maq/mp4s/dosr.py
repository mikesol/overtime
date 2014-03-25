import os
import subprocess
import sys
import urllib2

THRESH0 = 0.1
THRESH1 = 0.25

def get_samples(s) :
  lines = s.split('\n')
  return int(filter(lambda x : "Samples read:" in x, lines)[0].split("read:")[1])
  

def gulp(f) :
  infi = file(f, 'rb')
  out = infi.read()
  infi.close()
  return out

def do_analysis(fn) :
  root = fn[:-4]
  wav = '{0}.wav'.format(root)
  p = subprocess.Popen('ffmpeg -i {0} {1}'.format(fn, wav), shell=True)
  p.wait()
  p = subprocess.Popen('ffmpeg -i {0} -af "silencedetect=n=-35dB:d=0.2" -f null -'.format(wav), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  p.wait()
  durs = filter(lambda x : 'silencedetect' in x, p.stderr.read().split('\n'))
  stimes = []
  for x in range(len(durs)/2) :
    beg = float(durs[x * 2].split('silence_start:')[1])
    end = float(durs[x * 2 + 1].split('silence_end:')[1].split('|')[0])
    stimes.append((max(0, beg), max(0, end)))
  p = subprocess.Popen('sox {0} -n stat'.format(wav), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  p.wait()
  START = 0
  LENGTH = float(filter(lambda x : 'Length (seconds):' in x, p.stderr.read().split('\n'))[0].split('(seconds):')[1])
  stimes = [(START, START)] + stimes
  stimes = stimes + [(LENGTH, LENGTH)]
  ttimes = []
  for x in range(1, len(stimes)) :
    t1 = stimes[x-1][1]
    t2 = stimes[x][0]
    ttimes.append((t1,t2))
  while True :
    dirty = False
    for x in range(1,len(ttimes)) :
      if (ttimes[x][1] - ttimes[x-1][0]) < 15 :
        ttimes = ttimes[:x-1] + [(ttimes[x-1][0], ttimes[x][1])] + ttimes[x+1:]
        dirty = True
        break
    if not dirty :
      break
  ftimes = ttimes[:]
  for item in ftimes :
    t1 = item[0]
    t2 = item[1]
    if t2 > t1 :
      OUT = ''
      temp = '{0}-{1}-{2}'.format(root, t1, t2)
      if t2 - t1 < 15 :
        subprocess.call('sox {0} {1}.wav trim {2} {3}'.format(wav, temp, t1, t2 - t1), shell=True)
        subprocess.call('ffmpeg -i {0}.wav {0}.flac'.format(temp), shell=True)
        url = "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=fr-FR"
        audio = open('{0}.flac'.format(temp),'rb').read()
        headers={'Content-Type': 'audio/x-flac; rate=44100', 'User-Agent':'Mozilla/5.0'}
        ntimes = 0
        while ntimes < 20 :
          try :
            request = urllib2.Request(url, data=audio, headers=headers)
            response = urllib2.urlopen(request)
            OUT = response.read()
            break
          except :
            "FAIL", temp, ntimes
            ntimes += 1
        if ntimes == 20 :
          OUT = 'check manually\n'
        subprocess.call('rm {0}.wav'.format(temp), shell = True)
        subprocess.call('rm {0}.flac'.format(temp), shell = True)
      else :
        OUT = 'check manually\n'
      outfi = file(temp+'.txt','w')
      outfi.write(OUT)
      outfi.close()
  subprocess.call('rm {0}'.format(wav), shell=True)

IN = filter(lambda x : x != '', gulp('good_res.txt').split('\n'))

for F in IN :
  do_analysis(F)
