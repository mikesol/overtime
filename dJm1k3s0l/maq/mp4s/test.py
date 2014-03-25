import urllib2
for x in range(100) :
  try :
    url = "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=en-US"
    audio = open('../test.flac','rb').read()
    headers={'Content-Type': 'audio/x-flac; rate=44100', 'User-Agent':'Mozilla/5.0'}
    request = urllib2.Request(url, data=audio, headers=headers)
    response = urllib2.urlopen(request)
    print response.read()
    break
  except :
    print "Failed on", x
