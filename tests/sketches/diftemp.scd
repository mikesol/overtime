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
z = [Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/blop.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/clap.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/clap2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/hh.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/kick.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/ohh.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/strike.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/strike2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/tom.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/tempoDif/wood.aif")
];

)

{PlayBuf.ar(2,z[3])}.play

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
SynthDef(\silly, {|i, buf, speed=1.0|
		var freq = 2 + (i * 0.2);
		var mul = 0.05 + (i * 0.05);
		var add = 0.75 + (i * 0.15);
		var trig = i * 0.1;
		var snd = PlayBuf.ar(2,buf, BufRateScale.kr(buf) * SinOsc.kr(freq, 0, mul, add) * speed, Impulse.kr(trig));
	Out.ar(0, MonoGrain.ar(snd, 0.2, 20)
	);
}).send(s)
)

~foobar = Array.fill(z.size, {|i| Synth.new(\silly, [\i, i, \buf, z[i]])});

~foobar.do({|x| x.set(\speed, 1.3)})

(
~rates = [0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9];
~funcs = Array.fill(~rates.size, {|i|{
	~foobar.do({|x| x.set(\speed, ~rates[i])})
}});

)


c.value;
b.value;

~weTouch = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lesAmants/Bounces/lesAmants.aif");
Synth.new(\foobar,[\bufnum, ~weTouch, \vol, 1, \loop, 0]);


(
w = Window.new("GUI Introduction", Rect(200,200,800,100));
x = Array.fill(~rates.size, {|i|Button.new(w,Rect(10 + (i*30),0,30,30)).states_([[~rates[i]]])});
x.size.do({|i| x[i].action = { ~funcs[i].value; };});
w.front;
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
		snd*Demand.kr(Impulse.kr(Demand.kr(Impulse.kr(100), 0, Dseq([0.2,1,2,0.5,5,0.3,2], inf))), 0, Drand([0,0,0,1], inf));
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

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/audit/material1-flipper.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

