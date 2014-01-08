s=Server.local
s.boot
b= Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/wannadollar.wav")

{LoopBuf.ar(2,b,BufRateScale.kr(b),1,Line.kr(0,0*44100,10),Line.kr(0,0.2*44100,10),3*44100)}.play