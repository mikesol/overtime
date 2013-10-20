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
	Mix.ar(Array.fill(6, {|i|PlayBuf.ar(2,z[0],BufRateScale.kr(z[0])*(i+4), loop: 1)*SinOsc.kr(SinOsc.kr(4,i,2.pow(i), 2.pow(i+1) + 1),0,0.5,0.5)*(1.0/(i+2)) }))
}.play
)

(
{
	Mix.ar(Array.fill(6, {|i|PlayBuf.ar(2,z[0],BufRateScale.kr(z[0])*Line.kr((i+4),(i+1),10), loop: 1)*(1.0/(i+2)) }))
}.play
)

~my = 2;
//0 is great, 2 too, 1 ok, 3 too
(
{
	Mix.ar(Array.fill(6, {|i|PlayBuf.ar(2,z[~my],BufRateScale.kr(z[~my])*Line.kr((i+4),0.5 + (i*0.1),10), loop: 1)*(1.0/(i+2)) }))
}.play
)

AllpassN