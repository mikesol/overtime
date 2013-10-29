
s.reboot;
s.quit;
thisProcess.platform.recordingsDir;
Server.default.makeGui
Server.killAll;
s = Server.local;
s.boot;

ServerOptions.devices[3]
Server.local.options.inDevice_(ServerOptions.devices[3])
Server.local.options.outDevice_(ServerOptions.devices[2])

(
~crow0 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/single_crow0.wav");
~crow1 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/single_crow1.wav");
~crow2 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/single_crow2.wav");
~rooster = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/rooster.aiff");
~distant = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/distant_crows.wav");
~crows = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/crows.wav");
~cow  = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/cow.wav");
~cawseries = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/cawseries.aif");
~onecow  = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/onecow.wav");

)

(
SynthDef(\simple1, {|bufnum, rate, startpos = 0, loop = 0, doneAction = 2, vol = 1.0, freq = 22000|
	var snd;
	snd = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 1, startpos, loop, doneAction);
	snd = LPF.ar(Pan2.ar(snd), freq);
	snd = FreeVerb.ar(snd);
	Out.ar(0, snd * vol);
}).send(s);

SynthDef(\simple2, {|bufnum, rate, startpos = 0, loop = 0, doneAction = 2|
	var snd;
	snd = PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * rate, 1, startpos, loop, doneAction);
	Out.ar(0, snd);
}).send(s);
)


Routine.new({

	4.do({ |i|
		Synth.new(\simple1, [\bufnum, ~crow2, \rate, 1, \startpos, 0, \vol, 1.0 / (2**i), \freq, [22000,4000,3000,1000][i]]);
		0.4.wait;
	});
}).play;

Routine.new({

Synth.new(\simple2, [\bufnum, ~cawseries, \rate, 1.4]);
	0.7.wait;
	Synth.new(\simple2, [\bufnum, ~cawseries, \rate, 1.0]);
	0.7.wait;
	Synth.new(\simple2, [\bufnum, ~cawseries, \rate, 0.6]);
	0.7.wait;
			Synth.new(\simple1, [\bufnum, ~rooster, \rate, 0.7, \startpos, 0, \doneAction, 0]);
	0.7.wait;
				Synth.new(\simple1, [\bufnum, ~onecow, \rate, 0.7, \startpos, 0, \doneAction, 0]);

}).play;
Synth.new(\simple2, [\bufnum, ~happy, \rate, 8.0]);