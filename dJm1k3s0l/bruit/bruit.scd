/*
  ugh
  make everything like nrt, then either send msg or score...
*/

s = Server.local;
s.boot;

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

~makePitchEnv = { |buf, num, pulse, lines, ppath, pfat, xpath, xfat, ypath, yfat, offset = 0|
	var out;
	out = [];
	num.do({|i|
		var amt;
		amt = i * 1.0 / (num - 1);
		lines.do({|j|
			out = out ++ [[i * pulse, [\s_new, \doot, ~unique.value, 0, 0, \out, 1, \bufnum, buf,
				\pitch, ppath.at(amt) + ~where.(j, 0, lines - 1, pfat.at(amt).neg, pfat.at(amt)),
				\x, ~bound.(xpath.at(amt)+ ~where.(j, 0, lines - 1, xfat.at(amt).neg, xfat.at(amt)), 0, 1),
				\y, ~bound.(ypath.at(amt)+ ~where.(j, 0, lines - 1, yfat.at(amt).neg, yfat.at(amt)), 0, 1),
				\mult, 1.0]]];
		});
	});
	~offset.(out, offset);
	out;
};

~makeSmearEnv = { |buf, sbuf, num, pulse, spath, xpath, ypath, offset = 0|
	var out;
	out = [];
	num.do({|i|
		var amt;
		amt = i * 1.0 / (num - 1);
			out = out ++ [[i * pulse, [\s_new, \smear, ~unique.value, 0, 0, \out, 1, \bufnum, buf, \soundbufnum, sbuf,
				\smear, spath.at(amt),
				\x, xpath.at(amt),
				\y, ypath.at(amt),
				\mult, 1.0]]];
	});
	~offset.(out, offset);
	out;
};

~piecelen = 270;
//0.0.rand
~makenorm = {
	var offsets, ntimes, lines, ylimits, fuzzes, out;
	out = [];
	offsets = [0,10,9,8,7,6,5,4,3,2,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19].integrate; // 29
	ntimes = [14,13,12,11,10,9,8,7,7,7,6,5,6,5,6,5,6,6,7,8,9,10,11,12,13,14,15,16,17]*5;
	lines = [1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,15,12,10,9,8,5,4,3,2,1];
	ylimits = Array.fill(29, {|i| ~where.(i, 0, 29-1,0.1,1.0)});
	fuzzes =  Array.fill(29, {|i| ~where.(i, 0, 29-1,0.0,0.1)});
	offsets.size.do({|i|
		out = out ++ ~makePitchEnv.(0,
			ntimes[i],
			0.22 + (fuzzes[i] - (fuzzes[i].rand * 2.0)),
			lines[i],
			~senv.(1 + (fuzzes[i] - (fuzzes[i].rand * 2.0)), 1 + (fuzzes[i] - (fuzzes[i].rand * 2.0))),
			~senv.(0, fuzzes[i].rand * 2, 0),
			~senv.(1.0.rand, 1.0.rand, 1.0.rand),
			~senv.(0.2),
			~senv.(0.06 + ylimits[i].rand, 0.06 + ylimits[i].rand),
			~senv.(0.0),
			offsets[i]);
	});
	out;
};

~makelow = {
	var offsets, ntimes, lines, ylimits, fuzzes, out;
	out = [];
	offsets = [30,9,8,7,6,5,4,3,2,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].integrate; // 29
	//offsets = [30,60,90,120,140,150,170,200,230,250];
	ntimes = Array.fill(offsets.size, {|i| (290 - offsets[i]) });
	lines = [1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,15,12,10,9,8,5,4,3,2,1]; // ugggh
	ylimits = Array.fill(offsets.size, {|i| ~where.(i, 0, offsets.size-1,0.1,1.0)});
	fuzzes =  Array.fill(offsets.size, {|i| ~where.(i, 0, offsets.size-1,0.0,0.1)});
	offsets.size.do({|i|
		out = out ++ ~makePitchEnv.(1,
			ntimes[i],
			0.42 + (fuzzes[i] - (fuzzes[i].rand * 2.0)),
			lines[i],
			~senv.(1 + (fuzzes[i] - (fuzzes[i].rand * 2.0)), 1 + (fuzzes[i] - (fuzzes[i].rand * 2.0))),
			~senv.(0, fuzzes[i].rand * 2, 0),
			~senv.(1.0.rand, 1.0.rand, 1.0.rand),
			~senv.(0.2),
			~senv.(0.06 + ylimits[i].rand, 0.06 + ylimits[i].rand),
			~senv.(0.0),
			offsets[i]);
	});
	out;
};

~makelower = {
	var offsets, ntimes, lines, ylimits, fuzzes, out;
	out = [];
	//offsets = [30,9,8,7,6,5,4,3,2,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].integrate; // 29
	offsets = [60,90,120,140,150,170,200,230,250];
	ntimes = Array.fill(offsets.size, {|i| (290 - offsets[i]) / 4});
	lines = [1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,15,12,10,9,8,5,4,3,2,1]; // ugggh
	ylimits = Array.fill(offsets.size, {|i| ~where.(i, 0, offsets.size-1,0.1,1.0)});
	fuzzes =  Array.fill(offsets.size, {|i| ~where.(i, 0, offsets.size-1,0.0,0.1)});
	offsets.size.do({|i|
		out = out ++ ~makePitchEnv.(2,
			ntimes[i],
			4 + (fuzzes[i] - (fuzzes[i].rand * 2.0)),
			lines[i],
			~senv.(1 + (fuzzes[i] - (fuzzes[i].rand * 2.0)), 1 + (fuzzes[i] - (fuzzes[i].rand * 2.0))),
			~senv.(0, fuzzes[i].rand * 2, 0),
			~senv.(1.0.rand, 1.0.rand, 1.0.rand),
			~senv.(0.2),
			~senv.(0.06 + ylimits[i].rand, 0.06 + ylimits[i].rand),
			~senv.(0.0),
			offsets[i]);
	});
	out;
};

~makehigh = {
	var offsets, ntimes, lines, ylimits, fuzzes, out;
	out = [];
	offsets = [120,125,130,135,140,145,150]; // 29
	ntimes = [20,20,20,20,20,20,20,20]*5;
	lines = [1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,15,12,10,9,8,5,4,3,2,1];
	ylimits = Array.fill(29, {|i| ~where.(i, 0, 29-1,0.1,1.0)});
	fuzzes =  Array.fill(29, {|i| ~where.(i, 0, 29-1,0.0,0.1)});
	offsets.size.do({|i|
		out = out ++ ~makePitchEnv.(3,
			ntimes[i],
			0.22 + (fuzzes[i] - (fuzzes[i].rand * 2.0)),
			lines[i],
			~senv.(1 + (fuzzes[i] - (fuzzes[i].rand * 2.0)), 1 + (fuzzes[i] - (fuzzes[i].rand * 2.0))),
			~senv.(0, fuzzes[i].rand * 2, 0),
			~senv.(1.0.rand, 1.0.rand, 1.0.rand),
			~senv.(0.2),
			~senv.(0.06 + ylimits[i].rand, 0.06 + ylimits[i].rand),
			~senv.(0.0),
			offsets[i]);
	});
	out;
};
)

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
	instr = instr ++ ~makenorm.();
	instr = instr ++ ~makelow.();
	instr = instr ++ ~makelower.();
	instr = instr ++ ~makehigh.();
	instr = instr.sort({|a0, a1| a0[0] < a1[0]});
	now = 0;
	bigfatlist = bmsgs ++ smsgs ++ instr;
	bigfatlist = bigfatlist ++ [[bigfatlist[bigfatlist.size - 1][0] + 30, [\c_set, 0, 0]]];
	bigfatlist.do({|elem, i|
		//(elem[0] - now).wait;
		//if (i < 10, { elem.postln;});
		//s.sendMsg(*elem[1]);
		//now = elem[0];
	});
    opts.memSize = 2.pow(20);
    opts.maxNodes = 2.pow(20);
	Score.recordNRT(bigfatlist, ~path ++ "/pleasework.osc", ~path ++ "/normTest.aiff", options: opts);
}).play;
)