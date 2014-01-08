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
		[0,1,~stack.(35,1)],
		[32,1,~stack.(32,0.75)],
		[35,1,~stack.(32,1)],
		[51,1,~stack.(32,1)],
		[48,1,~stack.(32,0.75)],
		[64,1,~stack.(32,0.75)],
		[67,1,~stack.(64,0.25)],
		[70,1,~stack.(64,0.5)],
		[74,1,~stack.(64,2)],
		[85,1,~stack.(35,1)],
		[92,1,~stack.(35,0.9)],
		[95,1,~stack.(35,1,25)],
		[104,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[110,1,~stack.(64,1)],
		//[119,1,~stack.(64,1.25)],
		[127,1,~stack.(64,1.75)],
		[132,1,~stack.(64,0.5)],
		[140,1,~stack.(64,2)],
		[143,1,~stack.(64,3)],
		[145,1,~stack.(64,4)],
		[151,1,~stack.(64,1)],
		//[151,1,~stack.(64,0.25)],
		[155,1,~stack.(64,0.5)],
		[160,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[160,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[167,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[174,1,~stack.(64,1)],
		[184,1,~stack.(64,1.25)],
		[184,1,~stack.(64,1.75)],
		[189,1,~stack.(64,2)],
		[189,1,~stack.(64,0.75)],
		[194,1,~stack.(64,3)],
		[200,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[200,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[204,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[210,1,~stack.(64,1)],
		[210,1,~stack.(64,1.9)],
		[214,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[214,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		//[218,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[217,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.12],
		//[224,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.25],
		[225,1,~stack.(64,1.75)],
		[230,1,~stack.(64,1)],
		[233,1,~stack.(64,1.25)],
		[236,1,~stack.(64,1.75)],
		[239,1,~stack.(64,2)],
		[241,1,~stack.(64,0.75)],
		[241,1,~stack.(64,3)],
		[247,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[247,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.12],
		//[218,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[249,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.14],
		[251,1,~stack.(64,2)],
		[253,1,~stack.(64,1)],
		[255,1,~stack.(64,1.25)],
		[258,1,~stack.(64,1.75)],
		[261,1,~stack.(64,3)],
		[264,1,~stack.(64,4)],
		[268,1,~stack.(64,5)],
		[272,0.5,~stack.(32,0.2)],
		[279,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[281,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.12],
		//[218,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[283,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.13],
		[285,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.14],
		[287,1,~stack.(64,2)],
		[289,1,~stack.(64,1)],
		[291,1,~stack.(64,1.25)],
		[293,1,~stack.(64,1.75)],
		[295,1,~stack.(64,3)],
		[296,1,~stack.(64,4)],
		[297,1,~stack.(64,5)],
		//
		[293,1,~stack.(64,2-0.1)],
		[295,1,~stack.(64,1-0.1)],
		[297,1,~stack.(64,1.25-0.1)],
		[299,1,~stack.(64,1.75-0.1)],
		[301,1,~stack.(64,3-0.1)],
		[302,1,~stack.(64,4-0.1)],
		[303,1,~stack.(64,5-0.1)],
		[307,1,~stack.(64,0.17)],
		[310,4,[2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25].dup(10).flatten],
		[313,1,~stack.(64,1.0)],
		[316,1,~stack.(64,0.75)],
		[318,4.5,[2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25].dup(10).flatten + 0.15],
		[319,1,~stack.(64,2)],
		[321,1,~stack.(64,3)],
		[322,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[323,1,~stack.(64,4)],
		[223,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.12],
		[328,4.5,[2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25].dup(10).flatten + 0.15],
		[334,1,~stack.(64,1)],
		[335,4.5,[2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25].dup(10).flatten],
		[337,1,~stack.(64,0.75)],
		[340,4.5,Array.fill(20, {|i| 2+(i*0.1)}).dup(5).flatten - 0.15],
		[343,1,~stack.(64,2)],
		[346,1,~stack.(64,3)],
		[349,1,~stack.(64,2.5)],
		// ugh....
		[350,4.5,Array.fill(10,{|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 + (i* 0.15)]}).flatten],
		[352,1,~stack.(64,4.5)],
		[355,3,~stack.(64,3)],
		[358,1,~stack.(64,1)],
		[359,3,~stack.(64,1.5)],
			[360,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.03)]}).flatten.reverse],
		[361,1.1,~stack.(64,2.5)],
		[363,2.3,~stack.(64,2)],
		[366,1.7,~stack.(64,1)],
		[368,2.5,~stack.(64,1.25)],
		[369,3.3,~stack.(64,1.75)],
		[372,2.7,~stack.(64,3)],
		[373,4.5,Array.fill(10,{|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 + (i* 0.3)]}).flatten],
		[374,3.7,~stack.(64,4)],
		[376,3.1,~stack.(64,5)],

		// really start breaking up here...
				[361,1.1,~stack.(64,2.5)],
		[380,2.8,~stack.(64,2)],
		[384,3.2,~stack.(64,2.9)],
		[386,3.5,~stack.(64,0.9)],
		[390,4.6,~stack.(64,1.5)],
		[397,5.1,~stack.(64,3.2)],


		[385,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.2)]}).flatten.reverse],
		[396,4.5,Array.fill(10,{|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 + (i* 0.1)]}).flatten],
		[396,4.5,Array.fill(10,{|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 + (i* 0.4)]}).flatten],


			[400,1.1,~stack.(64,2.3)],
		[405,2.8,~stack.(64,1.8)],
		[409,3.2,~stack.(64,2.9)],
		[413,3.5,~stack.(64,0.8)],
		[415,4.6,~stack.(64,1.7)],
		[419,5.1,~stack.(64,3.6)],

		[410,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.1)]}).flatten.reverse],
		[410,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.3)]}).flatten.reverse],
		[416,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.5)]}).flatten.reverse],
		[416,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.3)]}).flatten.reverse],


		[420,1.1,~stack.(64,2.3)],
		[425,2.8,~stack.(64,1.8)],
		[430,3.2,~stack.(64,2.9)],
		[442,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.12],

		[436,4.5,Array.fill(10,{|i| [2,2.25,2.6,3.1,3.7,4.8,5.1,5.3,6.7 + (i* 0.1)]}).flatten],
		[436,4.5,Array.fill(10,{|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 + (i* 0.4)]}).flatten],
		[450,4.5,Array.fill(10, {|i| [2,2.25,2.6,3.1,3.7,4.8,5.1,5.3,6.7 - (i* 0.1)]}).flatten.reverse],
		[450,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.3)]}).flatten.reverse],
		[450,4.5,Array.fill(10, {|i| [2,2.25,2.6,3.1,3.7,4.8,5.1,5.3,6.7 - (i* 0.01)]}).flatten.reverse],
		[450,4.5,Array.fill(10, {|i| [2,2.25,2.5,2.75,3,3.25,3.5,3.75,3,4,4.25,4.5,4.75,5,5.25 - (i* 0.3)]}).flatten.reverse],
		//boo...
				[451,1,~stack.(64,2)],
		[453,1,~stack.(64,1)],
		[455,1,~stack.(64,1.25)],
		[458,1,~stack.(64,1.75)],
		[461,1,~stack.(64,3)],
		[462,1,~giantchain.()],
		[464,1,~stack.(64,4)],
		[468,1,~stack.(64,5)],
		[472,0.5,~stack.(32,0.2)],
		[473,1,~giantchain.()],
		[479,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten],
		[481,2,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.12],
		//[218,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.1],
		[483,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.13],
		[485,4,[0.5,0.75,1,2,3,4,3,2,1,0.75].dup(10).flatten - 0.14],
		[487,1,~stack.(64,2)],
		[489,1,~stack.(64,1)],
		[490,1,~giantchain.()],
		[491,1,~stack.(64,1.25)],
		[493,1,~stack.(64,1.75)],
		[495,1,~stack.(64,3)],
		[496,1,~stack.(64,4)],
		[497,1,~stack.(64,5)],

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
		(elem[0] - now).wait;
		elem.postln;
		s.sendMsg(*elem[1]);
		now = elem[0];
	});
    //opts.memSize = 2.pow(20);
    //opts.maxNodes = 2.pow(20);
	//Score.recordNRT(bigfatlist, ~path ++ "/pleasework.osc", ~path ++ "/crapLyon.aiff", options: opts);
}).play;
)
