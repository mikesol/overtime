ServerOptions.inDevices
Server.default.options.inDevice_(ServerOptions.inDevices[2])
thisProcess.platform.recordingsDir;
Server.default.makeGui
s = Server.local
s.boot
s.quit

(
~wagpath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants3/wagnerExcerpt.aif";
~wagbuf = Buffer.read(s,~wagpath);
~ropath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants3/romeoExcerpt.aif";
~robuf = Buffer.read(s,~ropath);


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
Synth.new(\simple2, [\bufnum, ~wagbuf, \rate, 1.0, \vol, 1]);
//Synth.new(\simplegrains, [\bufnum, ~ghostStation, \rate, 1.0, \vol, 2.0]);
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

{MonoGrain.ar(PlayBuf.ar(2,~wagbuf, BufRateScale.kr(~wagbuf), doneAction: 2), 0.1, 10)}.play;
(
{
	(SinOsc.kr(0.3, 0, 0.2, 0.7) * PitchShift.ar(PlayBuf.ar(2,~wagbuf, BufRateScale.kr(~wagbuf), doneAction: 2), 0.2, SinOsc.kr(0.2, 0, 0.1, 1)))
+
	(SinOsc.kr(0.3, 1pi, 0.2, 0.3) * PlayBuf.ar(2,~wagbuf, BufRateScale.kr(~wagbuf), doneAction: 2))
}.play;
)

(//2.2,1,10

Routine.new({
	{
	(SinOsc.kr(0.3, 0, 0.2, 0.7) * PitchShift.ar(PlayBuf.ar(2,~wagbuf, BufRateScale.kr(~wagbuf)*Line.kr(2.35,1,10), doneAction: 2), 0.2, SinOsc.kr(0.2, 0, 0.1, 1)))
+
	(SinOsc.kr(0.3, 1pi, 0.2, 0.3) * PlayBuf.ar(2,~wagbuf, BufRateScale.kr(~wagbuf)*Line.kr(2.35,1,10), doneAction: 2))
}.play;
	6.5.wait;
	//{(SinOsc.kr(0.3, 0, 0.2, 0.7) * PitchShift.ar(PlayBuf.ar(2,~robuf, BufRateScale.kr(~robuf), doneAction: 2), 0.2, SinOsc.kr(0.2, 0, 0.1, 1)))}.play;
	"foo".postln;
	{(PlayBuf.ar(2,~robuf, BufRateScale.kr(~robuf), doneAction: 2))}.play;
}).play;
)

{Pan2.ar(PitchShift.ar(SoundIn.ar, 0.2, 2.0) + PitchShift.ar(SoundIn.ar, 0.2, 0.5))}.play;

~otsingleton.value(~basic);