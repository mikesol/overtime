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


// normal
(
{
	var arr = Array.fill(z.size, {|i|
		PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]));
	});
	Out.ar(0, Mix.ar(arr), 0.2, 20);
}.play
)

// cooler
(
{
	var snd0 = PlayBuf.ar(2,z[0],BufRateScale.kr(z[0]) * SinOsc.kr(2, 0, 0.3, 1.3), Impulse.kr(0.2));
	var snd1 = PlayBuf.ar(2,z[1],BufRateScale.kr(z[1]) * SinOsc.kr(2.1, 0, 0.4, 1.3), Impulse.kr(0.1));
	var snd2 = PlayBuf.ar(2,z[2],BufRateScale.kr(z[2]) * SinOsc.kr(1.05, 0, 0.05, 1.3), Impulse.kr(0.25));
	var snd3 = PlayBuf.ar(2,z[3],BufRateScale.kr(z[3]) * SinOsc.kr(2.4, 0, 0.2, 1.3), Impulse.kr(0.005));
	var snd4 = PlayBuf.ar(2,z[4],BufRateScale.kr(z[4]) * SinOsc.kr(2.6, 0, 0.6, 1.3), Impulse.kr(0.05));
	var snd5 = PlayBuf.ar(2,z[5],BufRateScale.kr(z[5]) * SinOsc.kr(3, 0, 0.35, 1.3), Impulse.kr(0.0));
	var snd6 = PlayBuf.ar(2,z[6],BufRateScale.kr(z[6]) * SinOsc.kr(4.9, 0, 0.1, 1.3), Impulse.kr(1));
	var snd7 = PlayBuf.ar(2,z[7],BufRateScale.kr(z[7]) * SinOsc.kr(2, 0, 0.3, 1.3), Impulse.kr(0.8));
	Out.ar(0, snd0 + snd1 + snd2 + snd3 + snd4 + snd5 + snd6 + snd7);
}.play
)

// even cooler
(
{
	var arr = Array.fill(z.size, {|i|
		var freq = 2 + (i * 0.2);
		var mul = 0.05 + (i * 0.05);
		var add = 0.75 + (i * 0.15);
		var trig = i * 0.1;
		PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]) * SinOsc.kr(freq, 0, mul, add), Impulse.kr(trig));
	});
	Out.ar(0, MonoGrain.ar(Mix.ar(arr), 0.2, 20)
	);
}.play
)

// unbridled joy EVEN HIER JA !
(
{
	var arr = Array.fill(z.size, {|i|
		var imp = 0.1;
		var freq = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(z.size, { |j| 2 + (j * 0.2) }), inf));
		var mul = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(z.size, { |j| 0.05 + (j * 0.05) }), inf));
		var add = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(z.size, { |j| 0.75 + (j * 0.15) }), inf));
		var trig = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(z.size, { |j| 0.00 + (j * 0.1) }), inf));
		var snd = PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]) * SinOsc.kr(freq, 0, mul, add), Impulse.kr(trig));
		snd*Demand.kr(Impulse.kr(Demand.kr(Impulse.kr(100), 0, Dseq([0.2,1,2,0.5,5,0.3,2], inf))), 0, Drand([0,0,1], inf));
	});
	Out.ar(0,
		Limiter.ar(
		MonoGrain.ar(Mix.ar(arr), 0.2, 20)//*0.8
		)
	);
}.play
)

(
{
	var orig = SoundIn.ar(0);
	var total = 3;
	Pan2.ar(Mix.ar(Array.fill(total, {|i| PitchShift.ar(orig, 0.2, 0.9 + (i * 0.1))*(1.0)})));
}.play
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/audit/material3-0.1.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

