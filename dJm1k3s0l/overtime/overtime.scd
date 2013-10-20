ServerOptions.inDevices
Server.default.options.inDevice_(ServerOptions.inDevices[2])
thisProcess.platform.recordingsDir;
Server.default.makeGui
s = Server.local
s.boot
s.quit

(
~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/firstSoundOVERTIME.aif";
~ot = Buffer.read(s,~mypath);



SynthDef(\trigger, { |bufnum|
	var in, amp, shift, trig, gong;
	in = SoundIn.ar;
	amp = Amplitude.kr(in);
	trig = Trig1.kr(amp - 0.7, 100);
	shift = PitchShift.ar(in, 0.2, 0.6);
	gong = PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum), trig);
	Out.ar(0, Gate.ar(gong + shift, trig));
}).send(s);


/*

(
Routine.new({
	{LPCAnalyzer.ar(PlayBuf.ar(1, ~lite.bufnum, BufRateScale.kr(~lite.bufnum), doneAction: 2),Impulse.ar(440,0,0.2), 256, 50).dup}.play;
	2.0.wait;
	{LPCAnalyzer.ar(PlayBuf.ar(1, ~lite.bufnum, BufRateScale.kr(~lite.bufnum)*1.2, doneAction: 2),Impulse.ar(660,0,0.2), 256, 50).dup}.play;
}).play
)
*/
SynthDef(\makeSpace, {| bufnum, laglo = 0.1, laghi = 0.4, loop = 0, doneAction = 2 |
	var sound, x, y;

	x = (Lag.kr(TRand.kr(0,1,Impulse.kr(TRand.kr(0,1,Impulse.kr(0.5)))), SinOsc.kr(0.5).range(laglo, laghi)) * 2) - 1;
	y = Lag.kr(TRand.kr(0,1,Impulse.kr(TRand.kr(0,1,Impulse.kr(0.5)))), SinOsc.kr(0.5).range(laglo, laghi));
	sound = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), loop: loop, doneAction: doneAction);
	sound = LPF.ar(sound, 20000 - (y * 19000));
	sound = Pan2.ar(sound, x);
	Out.ar(0, sound * (1/(((y * 98) + 2)**1.2)));

}).send(s);

SynthDef(\simple2, {|bufnum, rate, startpos = 0, loop = 0, doneAction = 2, vol = 1|
	var snd;
	snd = PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * rate, 1, startpos, loop, doneAction);
	Out.ar(0, snd * vol);
}).send(s);

SynthDef(\simplejackit, {|bufnum, rate0, rate1, time, startpos = 0, loop = 0, doneAction = 2, vol = 1|
	var snd;
	snd = PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * Line.kr(rate0, rate1, time), 1, startpos, loop);
	Out.ar(0, snd * vol);
}).send(s);

SynthDef(\simplegrains, {|bufnum, rate, startpos = 0, loop = 0, doneAction = 2, vol = 1|
	var snd;
	snd = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 1, startpos, loop, doneAction);
	//snd = MonoGrain.ar(snd, SinOsc.kr(1.01, 0, 0.5, 0.6), SinOsc.kr(0.5, 0, 4, 4.5));
	snd = MonoGrain.ar(snd, 0.1, Line.kr(1,10,20));
	snd = Limiter.ar(snd * vol);
	snd = Pan2.ar(snd);
	Out.ar(0, snd);
}).send(s);

~otsingleton = { |bufnum, ilooplo = 0, iloophi = 4, olooplo = 50, oloophi = 100, swaitlo = 0.2, swaithi = 0.2, lwaitlo = 0, lwaithi = 4|
Routine {
	// total not necessary...
	var total = 0.0;
	var oloopn = { olooplo + (oloophi - olooplo).rand }.value;
	oloopn.value.do {
		var iloopn = { lwaitlo + (lwaithi - lwaitlo).rand }.value;
		var iwaitv = { swaitlo + (swaithi - swaitlo).rand }.value;
		var owaitv = { ilooplo + (iloophi - ilooplo).rand }.value;
		iloopn.value.do {
			Synth(\makeSpace, [\out, 4, \bufnum, bufnum, \loop, 0, \doneAction, 2, \laglo, 1.9]);
			iwaitv.wait;
			//"playing inner".postln;
			total = total + iwaitv;
		};
		owaitv.wait;
		total = total + owaitv;
	}
}.play
}; // ugh...what an ugly function!
)

~basic = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/basicDrum.aif");
~ghostStation = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/ghostStation.aif");
~ghostStation1 = Buffer.readChannel(s, "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/ghostStation.aif", channels: [0]);

TGrains
Synth.new(\trigger, [\bufnum, ~ot]);

(
~bleep =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/bleep.aif");
~ghostStation =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/ghostStation.aif");
~hihats =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/hihats.aif");
~hihatsMore =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/hihatsMore.aif");
~hihatsMoreMore =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/hihatsMoreMore.aif");
~littleHits =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/littleHits.aif");
~maracas =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/maracas.aif");
~simpleHit =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/simpleHit.aif");
~drone1 =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/drone1.aif");

)

(
//Synth.new(\simple2, [\bufnum, ~ghostStation, \rate, 1.0, \vol, 0.2]);
Synth.new(\simplegrains, [\bufnum, ~ghostStation, \rate, 1.0, \vol, 2.0]);
)
~basic
Synth.new(\simplejackit, [\bufnum, ~basic, \rate0, 3.0, \rate1, 0.05, \time, 10, \startpos, 0, \loop, 1]);

~guitar =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/overtime/Bounces/guitar.aif");


Synth.new(\simple2, [\bufnum, ~bleep, \rate, 1.0, \vol, 0.1]);
Synth.new(\simple2, [\bufnum, ~hihats, \rate, 1.0, \vol, 0.1]);
Synth.new(\simple2, [\bufnum, ~hihatsMore, \rate, 1.0, \vol, 0.1]);
Synth.new(\simple2, [\bufnum, ~hihatsMoreMore, \rate, 1.0, \vol, 0.1]);
Synth.new(\simple2, [\bufnum, ~littleHits, \rate, 1.0, \vol, 0.1]);
Synth.new(\simple2, [\bufnum, ~maracas, \rate, 1.0, \vol, 0.1]);

{PlayBuf.ar(2,~guitar, BufRateScale.kr(~guitar) * Line.kr(1,0.7,6), 1, 4000, doneAction: 2)}.play;

~otsingleton.value(~basic);