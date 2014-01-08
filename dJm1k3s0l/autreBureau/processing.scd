s = Server.local;
s.boot;


(
SynthDef("boring", {|bufnum, pitch, vol, ramp|
	var snd, env;
	env = Env.new([0,vol],[ramp]);
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum), doneAction: 2);
	Out.ar(0, snd * EnvGen.kr(env));
}).send;

SynthDef("speaking", {|bufnum, pitch|
	var snd;
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum), doneAction: 14);
	snd = snd + (PitchShift.ar(snd, 0.2, SinOsc.kr(100,0,0.4,pitch))*0.4);
	Out.ar(0, snd);
}).send;


SynthDef("speakingSimpler", {|bufnum, pitch, mul = 1.0|
	var snd;
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum), doneAction: 14);
	snd = snd + PitchShift.ar(snd, 0.2, pitch, mul: mul);
	Out.ar(0, snd);
}).send;

SynthDef("dots", {|out, bufnum, pitch|
	var snd, env;
	env = Env.new([0,1,1,0],[0.05,BufDur.kr(bufnum) - 0.1, 0.05]);
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum),doneAction: 2);
	snd = PitchShift.ar(snd, 0.2, pitch);
	Out.ar(out, snd*EnvGen.kr(env));
}).send;

SynthDef("reverb", {|in, out, vol|
	var snd;
	snd = In.ar(in, 2);
	snd = FreeVerb.ar(snd,0.8,0.8,0.8);
	Out.ar(out, snd * vol);
}).send;
)
