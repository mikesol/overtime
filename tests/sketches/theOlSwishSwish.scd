/*
  tracks were bounced out at different tempos
  some on off
*/

s.reboot;
s.quit;
thisProcess.platform.recordingsDir;
Server.default.makeGui
Server.killAll;
s = Server.local;
s.boot;

ServerOptions.devices
Server.local.options.inDevice_(ServerOptions.devices[3])
Server.local.options.outDevice_(ServerOptions.devices[2])

(
z = [
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants0.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants7.aif"),
]
)


(
{
	(PlayBuf.ar(2,z[2])*SinOsc.kr(SinOsc.kr(4,0,4.6,9.12),0,0.5,0.5)*0.5) + //PlayBuf.ar(2,z[2],SinOsc.kr(1,0,0.1,1))*SinOsc.kr(SinOsc.kr(4,0,4.6,19.12),0,0.5,0.5)+
	(PlayBuf.ar(2,z[2],BufRateScale.kr(z[2])*2)*SinOsc.kr(SinOsc.kr(4,0,4.6,9.12),0,0.5,0.5)*0.5)
}.play
)

(
{
	(PlayBuf.ar(2,z[1])*SinOsc.kr(SinOsc.kr(4,0,4.6,9.12),0,0.5,0.5)*0.5) + //PlayBuf.ar(2,z[2],SinOsc.kr(1,0,0.1,1))*SinOsc.kr(SinOsc.kr(4,0,4.6,19.12),0,0.5,0.5)+
	(PlayBuf.ar(2,z[1],BufRateScale.kr(z[1])*2)*SinOsc.kr(SinOsc.kr(4,0,4.6,9.12),0,0.5,0.5)*0.5)
}.play
)

(
{
	(PlayBuf.ar(2,z[6])*SinOsc.kr(SinOsc.kr(4,0,4.6,9.12),0,0.5,0.5)*0.5) + //PlayBuf.ar(2,z[2],SinOsc.kr(1,0,0.1,1))*SinOsc.kr(SinOsc.kr(4,0,4.6,19.12),0,0.5,0.5)+
	(PlayBuf.ar(2,z[6],BufRateScale.kr(z[1])*2)*SinOsc.kr(SinOsc.kr(4,0,4.6,9.12),0,0.5,0.5)*0.5)
}.play
)