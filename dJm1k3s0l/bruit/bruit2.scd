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

Synth.new(\single, [\out, 0, \bufnum, b, \rate, 0.5, \x, 0.5, \y, 0.2, \mult, 1]);
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
}).writeDefFile;
//.send(s);

SynthDef(\smear, { |out, bufnum, soundbufnum, smear, x, y, mult|
	var sound, chain;
    sound = PlayBuf.ar(1, soundbufnum, BufRateScale.kr(bufnum), doneAction: 2);
    chain = FFT(bufnum, sound);
    chain = PV_MagSmear(chain, smear);
	chain = IFFT(chain);
	sound = LPF.ar(chain, 20000 - (y * 19000));
	chain = Pan2.ar(chain, x * 2 - 1);
    Out.ar(out, mult * chain * (1/(((y * 98) + 2)**1.2)));
}).writeDefFile;
//send(s);

SynthDef(\limiter, {|in, out|
	var sound;
	sound = In.ar(in, 2);
	Out.ar(out,Limiter.ar(sound));
}).writeDefFile;
//.send(s);
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

~traj = {|pulse, ramp, buf, dur, offset = 0.0|
	var out = [];
	var total = offset;
	var pulsenow = pulse;
	var ratenow = 1.0;
	var i = 0;
	{total < dur}.while({
		// having it before avoids big slam
		(pulsenow > 0.01).if({pulsenow = pulsenow / ramp});
		((ratenow > 0.01).and(ratenow < 64)).if({ratenow = ratenow * ramp;});
		out = out ++ [[total, [\s_new, \single, ~unique.(), 0, 0, \out, 1, \bufnum, buf,
				\rate, ratenow,
			//\rate, Array.fill(500,{|i| (0.25 * i) + 0.05.rand }).minItem { |item| item absdif: ratenow },
			    \x, (i * 0.1).mod(1),
				\y, (i * 0.03).mod(0.3) + 0.1,
				\mult, 1.0]]];
		total = total + pulsenow;
		i = i + 1;
	});
	out;
}
)
~traj.(0.1,1.001, 0, 240, 180);

~now = 1000;
(
Routine.new({
	var bigfatlist, bmsgs, smsgs, instr, now, sfns, sfs, totalbufs;
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
	smsgs = [[0.0, [\s_new, \limiter, ~unique.value, 0, 0, \out, 0, \in, 1]]];
	instr = [];
	"TRYING".postln;
	6.do({|i|
		[0.98, 0.99, 0.995, 1.001, 1.002, 1.003].do({|v, j|
			instr = instr ++ ~traj.(0.22,v, 0, 240, (i * 36) + (j * 6) + 6);
		});
	});
	// base
	instr = instr ++ ~traj.(0.22,1.0, 0, 240);
	instr = instr.sort({|a0, a1| a0[0] < a1[0]});
	now = 0;
	bigfatlist = bmsgs ++ smsgs ++ instr;
	bigfatlist = bigfatlist ++ [[bigfatlist[bigfatlist.size - 1][0] + 30, [\c_set, 0, 0]]];
	bigfatlist.do({|elem, i|
		//(elem[0] - now).wait;
		//elem.postln;
		//s.sendMsg(*elem[1]);
		//now = elem[0];
	});
    opts.memSize = 2.pow(20);
    opts.maxNodes = 2.pow(20);
	Score.recordNRT(bigfatlist, ~path ++ "/pleasework.osc", ~path ++ "/crap6.aiff", options: opts);
}).play;
)
(
Routine.new({
	var bigfatlist, bmsgs, smsgs, instr, now, sfns, sfs, totalbufs;
	var opts = ServerOptions.new.numOutputBusChannels = 2;
	sfns = [~path++"/crap4.aiff"];
    sfs = Array.fill(sfns.size, {|i| var sf = SoundFile.new; sf.openRead(sfns[i]); sf; });
	bmsgs = [];
	totalbufs = 0;
	sfs.size.do({|i|
		bmsgs = bmsgs ++ [[0.0, [\b_alloc, totalbufs, sfs[i].numFrames, 2]],
			[0.0, [\b_read, totalbufs, sfns[i]]]];
		totalbufs = totalbufs + 1;
	});
	sfs.size.do({|i|
		bmsgs = bmsgs ++ [[0.0, [\b_alloc, totalbufs, 2048, 1]]];
		totalbufs = totalbufs + i;
	});
	sfs.do { |x| x.close; };
	smsgs = [[0.0, [\s_new, \limiter, ~unique.value, 0, 0, \out, 0, \in, 1]]];
	instr = [];
	instr = instr ++ [[0.0001, [\s_new, \sillycrap, ~unique.value, 0, 0, \out, 1, \bufnum, 0, \dur, 100, \downspd, 4]]];
	now = 0;
	bigfatlist = bmsgs ++ smsgs ++ instr;
	bigfatlist = bigfatlist ++ [[sfs[0].duration + 1, [\c_set, 0, 0]]];
	bigfatlist.do({|elem, i|
		//(elem[0] - now).wait;
		//elem.postln;
		//s.sendMsg(*elem[1]);
		//now = elem[0];
	});
    opts.memSize = 2.pow(20);
    opts.maxNodes = 2.pow(20);
	Score.recordNRT(bigfatlist, ~path ++ "/pleasework.osc", ~path ++ "/crap4distorteddownfasterboo.aiff", options: opts);
}).play;
)