/*
  ugh
  make everything like nrt, then either send msg or score...
*/

s = Server.local;
s.boot;
s.quit
s.killAll


(
{
	var in, snd;
	in = SoundIn.ar;
	snd = PitchShift.ar(in, 0.2, EnvGen.kr(Env.new([1,1,2],[40,100])));
	snd = snd + PitchShift.ar(in, 0.2, EnvGen.kr(Env.new([1,1,0.5],[40,100])));
}.play;
)

b = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/doot.aif");

Synth.new(\single, [\out, 0, \bufnum, b, \rate, 1.0, \x, 0.5, \y, 0.2, \mult, 3]);

Synth.new(\andtheylaughed, [\out, 0, \bufnum, c, \dur, 100]);

(

SynthDef(\andtheylaughed, {|out, bufnum, dur|
	var in, amount, amCoef;
	in = HPF.ar(PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum)), 0)*5;
	amount = (Line.ar(0,1,dur)**1)*0.99;
	amCoef= 2*amount/(1-amount);
	Out.ar(out, MidEQ.ar(LPF.ar((1+amCoef)*in/(1+(amCoef*in.abs)), [3800, 3900])*0.5, 120, 0.7, 8));
}).send(s).writeDefFile;

SynthDef(\sillycrap, {|out, bufnum, dur, downspd|
	var in, amount, amCoef;
	in = HPF.ar(PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum)*(EnvGen.kr(Env.new([1,1,0],[dur + 8, downspd], 'lin'), doneAction: 2)**0.4)), 0)*5;
	amount = (Line.ar(0,1,dur)**1)*0.99;
	amCoef= 2*amount/(1-amount);
	Out.ar(out, MidEQ.ar(LPF.ar((1+amCoef)*in/(1+(amCoef*in.abs)), [3800, 3900])*0.5, 120, 0.7, 8));
}).send(s).writeDefFile;

SynthDef(\single, { |out, bufnum, rate, x, y, mult|
	var sound;
	sound = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, doneAction: 2);
	sound = LPF.ar(sound, 20000 - (y * 19000));
	sound = Pan2.ar(sound, x * 2 - 1);
	Out.ar(out, mult * sound * (1/(((y * 98) + 2)**1.2)));
}).writeDefFile.send(s);
)
(
SynthDef(\doot, { |out, bufnum, pitch, x, y, mult|
	var sound;
	sound = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), doneAction: 2);
	sound = PitchShift.ar(sound, 0.2, pitch);
	sound = LPF.ar(sound, 20000 - (y * 19000));
	sound = Pan2.ar(sound, x * 2 - 1);
	Out.ar(out, mult * sound * (1/(((y * 98) + 2)**1.2)));
}).writeDefFile.send(s);

SynthDef(\smear, { |out, bufnum, soundbufnum, smear, x, y, mult|
	var sound, chain;
    sound = PlayBuf.ar(1, soundbufnum, BufRateScale.kr(bufnum), doneAction: 2);
    chain = FFT(bufnum, sound);
    chain = PV_MagSmear(chain, smear);
	chain = IFFT(chain);
	sound = LPF.ar(chain, 20000 - (y * 19000));
	chain = Pan2.ar(chain, x * 2 - 1);
    Out.ar(out, mult * chain * (1/(((y * 98) + 2)**1.2)));
}).writeDefFile.send(s);

SynthDef(\limiter, {|in, out|
	var sound;
	sound = In.ar(in, 2);
	Out.ar(out,Limiter.ar(sound));
}).writeDefFile.send(s);


SynthDef(\verblimiter, {|in, out|
	var sound;
	sound = In.ar(in, 2);
	Out.ar(out,Limiter.ar(FreeVerb.ar(sound * 2,1.0)));
}).writeDefFile.send(s);
)

(

~path = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit";
~names = ["doot", "lowdoot", "lowerdoot", "highdoot", "higha"];

~now = 1000;

~unique = {
	~now = ~now + 1;
	~now - 1;
};

~where = {|v, min0, max0, min1, max1|
	if (min0 == max0,
		{ min1 },
		{(((v * 1.0 - min0) / (max0 * 1.0 - min0)) * (max1 - min1)) + min1});
};

~offset = {|mya, off|
	mya.size.do({|i|
		mya[i][0] = mya[i][0] + off;
	});
};

~nenv = {|ls, ts|
	Env.new(ls, ts.normalizeSum);
};

~senv = {|...vals|
	var times;
	if (vals.size == 1, { vals = [vals[0], vals[0]]});
	times = if (vals.size == 2, { [1] }, {Array.fill(vals.size - 1, {1}).normalizeSum});
	Env.new(vals, times);
};

~senvex = {|...vals|
	var times;
	if (vals.size == 1, { vals = [vals[0], vals[0]]});
	times = if (vals.size == 2, { [1] }, {Array.fill(vals.size - 1, {1}).normalizeSum});
	Env.new(vals, times, 'exponential');
};


~bound = {|in, lo, hi|
	var out = in;
	if (in < lo, { out = lo});
	if (in > hi, { out = hi});
	out;
};

~myprint = {|...ugh|
	ugh.do({|foo|
		foo.post;
		" ".post;
	});
};

~stack = {|...stuff|
	var out = [];
	(stuff.size / 2).do({|i|
		out =  out ++ Array.fill(stuff[i*2], {stuff[i*2+1]});
	});
	out;
};

~makePitchEnv = { |buf, rates, pulse, xpath, ypath, offset = 0|
	var out;
	out = [];
	rates.do({|rate, i|
		var amt;
		amt = i * 1.0 / (rates.size - 1);
		out = out ++ [[i * pulse + ~nf.(offset), [\s_new, \single, ~unique.value, 0, 0, \out, 1, \bufnum, buf,
			    \rate, rate,
				\x, 1.0.rand,//~bound.(xpath.at(amt), 0, 1),
			//\y, 1.0.rand,
			\y, ~bound.(ypath.at(amt), 0, 0.99),//**(~bound.(1./rate,0,1)),
				\mult, 3.0]]];
	});
	//~offset.(out, offset);
	out;
};

~now = 1000;
~tempo = 0.2;
~nf = {|val|
	val*~tempo;
};

~giantchain = {|n=20|
	var out = [];
	var prev = 1.0.rand + 2;
	n.do({
		var new = [-1,1][1.rand];
		10.do({
			var cur = ~bound.(prev + (new*0.2), 0.25, 7);
			out = out ++ [cur];
			prev = prev + (new*0.2);
		});
	});
	out;
}

)

(
Routine.new({
	var hackishGlobalTimeMultiplier = 1;
	var bigfatlist, bmsgs, smsgs, instr, now, sfns, sfs, totalbufs, stuff;
	var opts = ServerOptions.new.numOutputBusChannels = 2;
	sfns = Array.fill(~names.size, {|i| (PathName(~path) +/+ PathName(~names[i]++".aif")).fullPath; });
    sfs = Array.fill(sfns.size, {|i| var sf = SoundFile.new; sf.openRead(sfns[i]); sf; });
	bmsgs = [];
	totalbufs = 0;
	sfs.size.do({|i|
		bmsgs = bmsgs ++ [[0.0, [\b_alloc, totalbufs, sfs[i].numFrames, 1]],
			[0.0, [\b_read, totalbufs, sfns[i]]]];
		totalbufs = totalbufs + 1;
	});
	sfs.size.do({|i|
		bmsgs = bmsgs ++ [[0.0, [\b_alloc, totalbufs, 2048, 1]]];
		totalbufs = totalbufs + i;
	});
	sfs.do { |x| x.close; };
	smsgs = [[0.0, [\s_new, \verblimiter, ~unique.value, 0, 0, \out, 0, \in, 1]]];
	instr = [];
	"TRYING".postln;
	stuff = [
		[0,0.0625,~stack.(16,1)],
		[24,0.125,~stack.(16,1)],
		[40,0.17,~stack.(16,1)],
		[56,0.5,~stack.(16,1)],
		[67,0.5,~stack.(8,1)],
		[75,0.25,~stack.(16,1)],
		[87,0.5,~stack.(16,1)],
		[93,0.25,~stack.(8,1)],
		[105,0.5,~stack.(24,1)],
		[117,0.25,~stack.(16,1)],

	];
	instr = [];
	stuff.do({|entry|
		instr = instr ++ ~makePitchEnv.(0,
			entry[2],
			~tempo/entry[1],
			~senvex.(1.0.rand, 1.0.rand),
			~senvex.(0.1, 1.0),
			(entry[0]*hackishGlobalTimeMultiplier).round);
	});
	// base
	//instr = instr ++ ~traj.(0.22,1.0, 0, 240);
	instr = instr.sort({|a0, a1| a0[0] < a1[0]});
	now = 0;
	bigfatlist = bmsgs ++ smsgs ++ instr;
	bigfatlist[bigfatlist.size - 1][0].postln;
	bigfatlist = bigfatlist ++ [[bigfatlist[bigfatlist.size - 1][0] + 30, [\c_set, 0, 0]]];
	bigfatlist.do({|elem, i|
		//(elem[0] - now).wait;
		//elem.postln;
		//s.sendMsg(*elem[1]);
		//now = elem[0];
	});
    opts.memSize = 2.pow(20);
    opts.maxNodes = 2.pow(20);
	Score.recordNRT(bigfatlist, ~path ++ "/pleasework.osc", ~path ++ "/crapLyonIntro.aiff", options: opts);
}).play;
)
