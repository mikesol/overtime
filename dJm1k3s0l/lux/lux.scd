s = Server.local
s.boot
s.quit

all {: x+1, x <- [1,2,3] }

~luHigh = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/luHigh.aif");
~luLow = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/luLow.aif");
~wheel = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/wheel.aif");
~ryanScary = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/ryanScary.aif");
(
~floodFrozens = [
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lux/floodFrozen0.aiff"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lux/floodFrozen1.aiff"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lux/floodFrozen2.aiff")
];
)

Synth.new(\chord3, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.75, \p1, 1.0, \p2, 1.2]);
Synth.new(\chord3, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.6, \p1, 1.0, \p2, 1.3]);
Synth.new(\chord3, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.65, \p1, 1.0, \p2, 1.33]);
Synth.new(\chord4, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.58, \p1, 0.9, \p2, 1.21, \p3, 1.5]);
Synth.new(\chord4, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.53, \p1, 0.9, \p2, 1.21, \p3, 1.7]);
Synth.new(\chord4, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.65, \p1, 0.92, \p2, 1.1, \p3, 1.2]);
Synth.new(\chord5, [\out, 0, \vol, 1, \buf, ~luHigh, \p0, 0.4, \p1, 0.9, \p2, 1.2, \p3, 1.45, \p4, 1.8]);

Synth.new(\oneNote, [\out, 0, \vol, 1, \buf, ~luLow, \rate, 0.25]);
Synth.new(\ramp, [\out, 0, \vol, 1, \buf, ~wheel, \rate0, 1.3, \rate1, 0.8]);
Synth.new(\ramp, [\out, 0, \vol, 1, \buf, ~wheel, \rate0, 1.5, \rate1, 1.0]);

(
b = [
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/luxMarie.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/luxMike.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/luxRyan.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lights/Bounces/luxEudes.aif")
];
SynthDef(\oneNote,{|out=0, vol=1, buf, rate=1.0, pan=0.0|
	var snd;
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * rate, doneAction: 2);
	snd = Pan2.ar(snd, pan);
	Out.ar(0, Line.kr(0,1,5)*snd*vol);/////ugh
}).send(s);

SynthDef(\oneNoteKludge,{|out=0, vol=1, buf, rate=1.0, pan=0.0|
	var snd;
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * rate, doneAction: 2);
	snd = Pan2.ar(snd, pan);
	Out.ar(0, EnvGen.kr(Env.new([0,1,0],[5,5]))*snd*vol);////////////////ugh
}).send(s);

SynthDef(\ramp,{|out=0, vol=1, buf, rate0=1.0, rate1=1.0, pan=0.0, offset = 0, dur = 1000, decay=1|
	var snd, env;
	env = Env.new([0,1,0],[0.1, dur - 0.2, 0.1]);
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * Line.kr(rate0, rate1, BufDur.kr(buf)), startPos: offset * BufSampleRate.kr(buf), doneAction: 2) * Line.kr(1,decay, BufDur.kr(buf));
	snd = Pan2.ar(snd, pan);
	Out.ar(out, snd * EnvGen.kr(env, doneAction: 2) * vol);
}).send(s);


SynthDef(\boringSingle,{|buf, out=0, vol=1, fade=0.01|
	Out.ar(out, vol * Pan2.ar(PlayBuf.ar(1, buf, BufRateScale.kr(buf), doneAction: 2)));

}).send(s);

SynthDef(\boring,{|out=0, vol=1, fade=0.01|
	Out.ar(out, Line.kr(0,1,fade) * Lag.kr(vol,5.0)*Mix.ar(Array.fill(4, {|j|
		var i = [1,2,3,0][j];
		var foo = 0.9 + (0.05 * i);
		Pan2.ar(PlayBuf.ar(1, b[j], BufRateScale.kr(b[j]), loop:1), i / 4.0 - 0.5);
	})));

}).send(s);

SynthDef(\lynch,{|grrr=2,out=0, vol=1, fade=0.2|
	Out.ar(out, Lag.kr(vol,5.0)*Mix.ar(Array.fill(4, {|j|
		var i = [1,2,3,0][j];
		var foo = 0.9 + (0.05 * i);
		SinOsc.kr(fade + (i * 0.1), 0, 0.4, 0.6) * Pan2.ar(PitchShift.ar(PlayBuf.ar(1, b[j], BufRateScale.kr(b[j])*grrr, loop:1), 0.2, 1.0/grrr), i / 4.0 - 0.5);
	})));

}).send(s);

SynthDef(\lynchKludge,{|grrr=2,out=0, vol=1, fade=0.2| //nobass
	Out.ar(out, Lag.kr(vol,5.0)*Mix.ar(Array.fill(3, {|j|
		var i = [1,2,3,0][j];
		var foo = 0.9 + (0.05 * i);
		SinOsc.kr(fade + (i * 0.1), 0, 0.4, 0.6) * Pan2.ar(PitchShift.ar(PlayBuf.ar(1, b[j], BufRateScale.kr(b[j])*grrr, loop:1), 0.2, 1.0/grrr), i / 4.0 - 0.5);
	})));

}).send(s);

SynthDef(\tame,{|out=0, vol=1, fade = 0.01|
	Out.ar(out, /*Line.kr(0,1,fade) * */Lag.kr(vol,5.0)*Mix.ar(Array.fill(4, {|j|
		var i = 1;
		var foo = 0.9 + (0.05 * i);
		SinOsc.kr(fade + (i * 0.1), 0, 0.4, 0.6) * Pan2.ar(PlayBuf.ar(1, b[j], BufRateScale.kr(b[j])*Lag.kr(Demand.kr(Impulse.kr((i+1)*0.4),0,Drand([0.8,0.9,1.0,1.1,1.2], inf)), 3), loop:1), i / 4.0 - 0.5);
	})));

}).send(s);

SynthDef(\lesstame,{|out=0, vol=1|
	Out.ar(out, Lag.kr(vol,5.0)*Mix.ar(Array.fill(4, {|j|
		var i = [1,2,3,0][j];
		var foo = 0.9 + (0.05 * i);
		Pan2.ar(PlayBuf.ar(1, b[j], BufRateScale.kr(b[j])*Lag.kr(Demand.kr(Impulse.kr((i+1)*0.4),0,Drand([0.75,0.87,1.0,1.23,1.4], inf)), 3), loop:1), i / 4.0 - 0.5);
	})));

}).send(s);


SynthDef(\foo,{|out=0, vol=1, fade=0.2|
	Out.ar(out, Lag.kr(vol,5.0)*Mix.ar(Array.fill(4, {|j|
		var i = [1,2,3,0][j];
		var foo = 0.9 + (0.05 * i);
		SinOsc.kr(fade + (i * 0.1), 0, 0.4, 0.6) * Pan2.ar(PlayBuf.ar(1, b[j], BufRateScale.kr(b[j])*Lag.kr(Demand.kr(Impulse.kr((i+1)*0.4),0,Drand([0.5,0.9,1.0,1.2,1.7], inf)), 0.2), loop:1), i / 4.0 - 0.5);
})))}).send(s);

SynthDef(\justone, {|buf, out=0, vol=1, fade=0.2|
	var i = 1;
	var foo = 0.9 + (0.05 * i);
	Out.ar(out, Lag.kr(vol,5.0)*
		SinOsc.kr(fade + (i * 0.1), 0, 0.4, 0.6) * Pan2.ar(PlayBuf.ar(1, buf, BufRateScale.kr(buf)*Lag.kr(Demand.kr(Impulse.kr((i+1)*0.4),0,Drand([0.5,0.9,1.0,1.2,1.7], inf)), 0.2), loop:1),0.0));
}).send(s);

SynthDef(\justoneKludge, {|buf, out=0, vol=1, fade=0.2|
	var i = 1;
	var foo = 0.9 + (0.05 * i);
	Out.ar(out, Lag.kr(vol,5.0)*
		SinOsc.kr(fade + (i * 0.1), 0, 0.4, 0.6) * Pan2.ar(PlayBuf.ar(1, buf, BufRateScale.kr(buf)*Lag.kr(Demand.kr(Impulse.kr((i+1)*0.4),0,Drand([1.0,1.2,1.7], inf)), 0.2), loop:1),0.0));
}).send(s);

SynthDef(\bar, {|out=0, vol=1|
	var foo = SoundIn.ar;
	Out.ar(out,Lag.kr(vol,5.0)*Pan2.ar(PitchShift.ar(foo,0.2,0.8) + foo + PitchShift.ar(foo,0.2,1.2)))
}).send(s);

SynthDef(\limiter, {|in=1,out=0, vol=1|
	Out.ar(out, Lag.kr(vol,5.0)*Limiter.ar(In.ar(in, 2)));
}).send(s);

SynthDef(\space, {|in=1,out=0, vol=1|
	var input = In.ar(in, 2);
	Out.ar(out, vol * FreeVerb2.ar(input[0], input[1], 0.9, 0.9, 0.9));
}).send(s);

SynthDef(\flip, {|buf0, buf1, buf2, out=0, pan=0, vol=1, fade=2, pdur=10|
	var arr, snd, bufs;
	bufs = [buf0, buf1, buf2];
	arr = Array.fill(3,{|i| Normalizer.ar(PlayBuf.ar(1,bufs[i], BufRateScale.kr(bufs[i])))* SinOsc.kr(0.3,i*2pi/3,0.5,0.5)});
	snd = HPF.ar(Mix.ar(arr), EnvGen.kr(Env.new([3,300,22000],[pdur,10]), doneAction: 2));
	Out.ar(out, (EnvGen.kr(Env.new([0,0,1],[0.1,fade]))**2) * vol * Pan2.ar(snd, pan));
}).send(s);

~basicstuff ={|tin, synth, args, tout|
	Routine.new({
	var snew;
	tin.wait;
	synth.postln;
	snew = Synth.new(synth, args);
	(tout - tin).wait;
	snew.set(\vol, 0);
}).play};


~luChord = {|...vals|
	vals.size.do({|i|
		Synth.new(\ramp, [\out, 3, \vol, 0.6/vals.size, \buf, ~luHigh, \rate0, vals[i], \rate1, vals[i], \pan, 0.0, \offset, 0, \dur, 1000, \decay, {if(i==0,{0},{0.8})}.()]);
	});
};

~luDown = {|...vals|
	Routine.new({
	(vals.size - 1).do({|i|
		Synth.new(\ramp, [\out, 2, \vol, 1.0/vals.size, \buf, ~wheel, \rate0, vals[i][0], \rate1, vals[i][1], \pan, 0.0, \offset, 0, \dur, 1000]);
			vals[vals.size - 1].wait;
	})}).play;
};

~chords =	{|offset=0|
	Routine.new({
	var chords;
		var waits;
	chords = [
	[0.75, 1.0, 1.2],
	[0.6, 1.0, 1.3],
	[0.58, 0.9, 1.21, 1.5],
	[0.53, 0.9, 1.21, 1.7],
	[0.65, 0.92, 1.1, 1.2],
	[0.4, 0.9, 1.2, 1.45, 1.8],
	[0.9, 1.13, 1.5, 1.72, 2.0],
	[0.86, 1.13, 1.6, 1.72, 1.83],
	[0.7, 0.84, 1.09, 1.5, 1.63, 1.75, 1.91],
	[0.68, 0.71, 1.01, 1.4, 1.59, 1.8, 1.91],
	[0.73, 0.81, 0.9, 1.2, 1.62, 1.84, 1.93],
	[0.64, 0.79, 0.99, 1.03, 1.3, 1.44, 1.92, 1.94],
	[0.71, 0.8, 1.2, 1.54, 1.8],
	[0.73, 0.89, 0.95, 1.0, 1.13, 1.22, 1.44, 1.61, 1.89, 2.11, 2.3]];
		offset.wait;
		waits = [6.0,6.3,8.0,6.3,6.6,7.2,7.2,7.4,7.6,7.8,8.0,8.2,8.2,8.2,8.3,8.4,8.4,8.4,8.4,8.4,8.4,8.4];
	chords.size.do({|i|
		~luChord.valueArray(chords[i]);
			"CHORD ".post; waits[i].post; " ".post; i.postln;
			waits[i].wait;
	});
}).play};


~down =	{|offset=0|
	"doing down".postln;
	Routine.new({
	var down;
	down = [
			[[1.2, 0.8],0],
				[[1.3,0.8],[1.5,1.0],0],
			[[1.2, 0.8],0],
			[[1.35,0.8],[1.61,1.0],0],
			[[1.2, 0.8],0],
			[[1.23,0.8],[1.41,0.95],[1.69,1.0],0],
			[[1.2, 0.8],0],
			[[1.31,0.8],[1.53,0.95],[1.86,1.0],0],
			[[1.2, 0.8],0],
			[[1.42,0.8],[1.64,0.95],[1.97,1.0],0],
			[[1.2, 0.8], [1.24, 0.84],0],
			[[1.46,1.3],[1.59,1.3],[2.03,1.8],[1.46,0.8],[1.59,0.95],[2.03,1.0],0],
			[[1.2, 0.8], [1.27, 0.89],0],
			[[1.54,1.2],[2.2,1.9],[1.3,1.8],[1.54,0.8],[1.8,0.95],[2.2,1.0],0],
			[[1.1, 0.82], [1.2, 0.8], [1.27, 0.89],0],
			[[1.6,1.2],[2.35,1.4],[1.2,1.8],[1.6,0.8],[1.9,0.95],[2.35,1.0],0],
			[[1.08, 0.85], [1.2, 0.8], [1.3, 0.9],0.1],
			[[1.3,1.8],[2.4,2.2],[1.9,1.0],[1.6,0.8],[1.0,1.8],[2.4,1.0],0],
			[[1.0, 0.85], [1.1,0.95], [1.2, 0.8], [1.3, 0.9],0.2],
			[[1.0,2.0],[1.3,2.02],[1.2,1.8],[1.9,0.8],[2.45,2.25],[2.55,2.35],0],
			[[1.1, 0.85], [1.25,0.95], [1.2, 0.8], [1.4, 0.9],0.25],
			[[2.0,1.8],[2.0,2.2],[2.1,1.5],[2.1,2.3],[1.6,0.7],[2.0,0.9],[1.2,0.8],0.4],
			[[1.15, 0.65], [1.4,0.95], [1.2, 0.8], [1.5, 0.95],0.35],
			[[1.1,0.9],[1.1,1.3],[1.2,1.0],[1.2,1.4],[1.5,1.0],[1.5,2.0],[1.8,1.1],[1.8,2.5],[1.9,1.8],[1.9,2.0],[2.1,1.75],[2.1,2.55],0.2],


		];"CRAP".postln;offset.postln;
		offset.wait;
		"WORKING".postln;
	down.size.do({|i|
		~luDown.valueArray(down[i]);
			"DOWN ".post; i.postln;
			5.wait;
	});
}).play};


~sustain = {|n=0, offset=0, p=1|
	Routine.new({
		offset.wait;
		n.do({
			Synth.new(\ramp, [\out, 2, \vol, 1, \buf, ~luLow, \rate0, p, \rate1, p, \pan, 0.0, \offset, 0, \dur, 1000]);
			(~luLow.duration*0.3/p).wait;
		});
	}).play;
};

~realSinger = {|wait,idx|
	Routine.new({wait.wait;
		Synth.new(\boringSingle, [\buf, b[idx], \vol, 0.6, \out, 2]);
		["MARIE","MIKE","RYAN","EUDES"][idx].postln;
	}).play;
};
)



	Routine.new({
		"started".postln;
		Synth.new(\ramp, [\out, 0, \vol, 1, \buf, ~wheel, \rate0, 1.2, \rate1, 0.8]);
		5.wait;
		Synth.new(\ramp, [\out, 0, \vol, 1, \buf, ~wheel, \rate0, 1.3, \rate1, 0.8]);
		Synth.new(\ramp, [\out, 0, \vol, 1, \buf, ~wheel, \rate0, 1.5, \rate1, 1.0]);
	}).play;


(
Synth.new(\limiter, [\in, 2, \out, 0]);
//~down.(0);
~realSinger.(0,1);
)

(
Synth.new(\limiter, [\in, 2, \out, 0]);
Synth.new(\space, [\in, 3, \out, 2]);
~chords.(0);
)

Synth.new(\boringSingle, [\buf, b[0], \vol, 0.6]);"MARIE".postln;
Synth.new(\boringSingle, [\buf, b[1], \vol, 0.6]);"MIKE".postln;
Synth.new(\boringSingle, [\buf, b[2], \vol, 0.6]);"RYAN".postln;
Synth.new(\boringSingle, [\buf, b[3], \vol, 0.6]);"EUDES".postln;
b[3].duration
(
Routine.new({
	var bassloop;
	var limiter;
	var ugggh;
	var start = 32;
	//var start = 0;
	var offset = start + 88;
	thisThread.randSeed = 0;
	limiter = Synth.new(\limiter, [\in, 2, \out, 0]);
	limiter = Synth.new(\space, [\in, 3, \out, 2]);
`"starting down".postln;
	~down.(0);

	~basicstuff.(start, \justone, [\buf, b[0], \out, 2, \fade, 0.5, \vol, 0.5], offset + 0);

	~chords.(start + 10);

	~basicstuff.(start + 12.5, \justoneKludge, [\buf, ~ryanScary, \out, 2, \fade, 2, \vol, 0.3], offset + 0);
		ugggh = [
			[25, 1.5],
			[30, 1.9],
			[35, 2.2],
			[40, 3.7],
		];
	ugggh.do({|ugh|
		(start + ugh[0]).postln;
		~basicstuff.(start + ugh[0], \lynchKludge, [\grrr, 16, \out, 2, \vol, 0.4, \fade, 0.2], start + ugh[0] + ugh[1]);
	});

	Routine.new({
		(start + 30).wait;
		Synth.new(\oneNote, [\out, 2, \vol, 0.2, \buf, ~luLow, \rate, 0.25]);
	}).play;

	Routine.new({
		(start + 55).wait;
		Synth.new(\oneNoteKludge, [\out, 2, \vol, 0.2, \buf, ~luLow, \rate, 0.273]);
	}).play;

	Routine.new({(start + 60).wait;"DOING FREEZE".postln;
	Synth.new(\flip, [\buf0, ~floodFrozens[0], \buf1, ~floodFrozens[1], \buf2, ~floodFrozens[2], \out, 2, \pan, 0,\vol, 1.0, \fade, 40, \pdur, 45]);

	}).play;

	bassloop = 89.2;
	/*~realSinger.(20.65, 0);
	~realSinger.(40.2, 2);
	~realSinger.(53, 0);
	~realSinger.(60.3, 1);
	~realSinger.(66.5, 3);
	~realSinger.(72.5, 0);
	~realSinger.(78.9, 2);
	~realSinger.(83.1, 1);
	~realSinger.(bassloop, 3);
	~realSinger.(93, 0);
	~realSinger.(97, 2);
	~realSinger.(100.5, 1);
	~realSinger.(bassloop + b[3].duration, 3);
	~realSinger.(113,0);
	~realSinger.(115,1);
	~realSinger.(117,2);
	~realSinger.(bassloop + (b[3].duration * 2),3);*/

	Routine.new({131.3.wait; {Out.ar(2,0.3 * Pan2.ar(PitchShift.ar(PlayBuf.ar(1,~luLow,1,doneAction: 2), 0.2, 2.7) * EnvGen.kr(Env.new([0,1,0],[5,5])), Line.kr(-0.37, 0.37, 10)))}.play;}).play;

	Routine.new({500.do({|i| i.postln; 1.wait;})}).play;
	//~basicstuff.(start, \tame, [\out, 2, \fade, 0.5, \vol, 0.2], offset + 15);
	//~basicstuff.(start + 0, \boring, [\ out, 2, \fade, 4, \vol, 0.4], offset + 0);
	//~basicstuff.(start + 20, \lynch, [\grrr, 4, \out, 2, \vol, 0.2, \fade, 0.4], offset + 12);
	//~basicstuff.(start + 8, \lynch, [\grrr, 16, \out, 2, \vol, 0.5, \fade, 0.4], offset + 4);
	//~basicstuff.(start + 16, \foo, [\out, 2, \vol, 0.5, \fade, 0.4], offset + 10);
	//~basicstuff.(start + 32, \lynch, [\grrr, 0.5, \out, 2, \vol, 0.5, \fade, 0.4], offset + 16);
	//~basicstuff.(start + 34, \lynch, [\grrr, 0.5, \out, 2, \vol, 0.5, \fade, 0.4], offset + 6);

	// and...


	// and...



}).play;
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lux/coupureDeCourantSansVoix.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}

(
Routine.new({
	//~chords.(0);

	// and...

	~down.(0);
}).play;
)

(
~freezeBuf = Buffer.alloc(s,1024);
~moneyBuf = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lux/flood.wav");
)

// compare PV_Freeze with PV_MagFreeze
(
//trig with MouseY
SynthDef("help-magFreeze2", { arg out=0, bufnum=0, soundBufnum=2;
	var in, chain;
	in = PlayBuf.ar(1, soundBufnum, BufRateScale.kr(soundBufnum), startPos: 2*44100);
	chain = FFT(bufnum, in);
	// uncomment the line below to compare while ...
//	chain = PV_MagFreeze(chain, MouseY.kr > 0.5 );
	// commenting the line below
	chain = PV_Freeze(chain, Line.kr(-1,1,2.4) );
	Out.ar(out, 0.5 * IFFT(chain).dup);
}).play(s,[\out, 0, \bufnum, ~freezeBuf, \soundBufnum, ~moneyBuf]);
)

