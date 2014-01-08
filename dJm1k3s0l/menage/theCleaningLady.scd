s = Server.local
s.boot
(
SynthDef.new("vinylCrackling", { arg out = 0, vol = 1;
	var pop, imp, modImp, midNoise, hiNoise, loNoise, loopTime, numChan,w, x, y;

	loopTime = 8;
	numChan = 2;

	//Harder pops
	pop = TDuty.ar(Dseq({ 1.0.bilinrand.abs } ! loopTime, inf));
	pop = Resonz.ar(Decay.ar(pop, TRand.ar(0.001, 0.1, pop)), Demand.ar(pop, 0, Dseq({ 7000.bilinrand.abs + 40 } ! 		loopTime, inf)), mul: Demand.ar(pop, 0, Dseq({ exprand(0.1, 0.87) } ! loopTime, inf)));
	pop = LeakDC.ar(pop, TRand.ar(0.9, 0.9995, pop));
	#w, x, y = PanB2.ar(pop, Demand.ar(pop, 0, Dseq({ 1.0.rand2 } ! loopTime, inf)));

	//Softer, highpass filtered impulses
	imp = { arg i; HPF.ar(LPF.ar(Dust2.ar(8), 8000.0), 6000.0, WhiteNoise.ar(0.7)) } ! numChan;

	//Faster, modulated lowpass filtered impulses
	modImp = LPF.ar(Dust.ar(LFDNoise3.ar(1).exprange(100, 500), LFDNoise3.ar(10).exprange(0.01, 0.07)), 9000.0) ! numChan;

	//Mid frequency modulated noise background
	midNoise = LPF.ar(GrayNoise.ar(LFDNoise3.ar(60)) * WhiteNoise.ar(0.009), 12000.0) ! numChan;

	//High frequency modulated noise background
	hiNoise = HPF.ar(LPF.ar(GrayNoise.ar(LFDNoise3.ar(60)) * WhiteNoise.ar(0.01), 14000.0), 8000.0) ! numChan;

	//Low frequency modulated noise background
	loNoise = LPF.ar(BrownNoise.ar(PinkNoise.ar.range(0.001, 0.02)), 1200) ! numChan;

	Out.ar(out, vol * (DecodeB2.ar(numChan, w, x, y) + imp + modImp + midNoise + hiNoise + loNoise));
	}).send(s);
)

(
SynthDef("background0", {|bufnum, out, vol=1.0, rate=1.0|
	var snd, env;
	env = Env.new([0,1.06,1],[5,2]);
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum)*EnvGen.kr(env)*Lag.kr(rate, 10),doneAction: 2);
	Out.ar(out, snd * Lag.kr(vol,5))
}).send(s);

SynthDef("background1", {|bufnum, out, vol=1.0, rate=1.0, sp=0|
	var snd;
	snd = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)*Lag.kr(rate, 10)*SinOsc.kr(Demand.kr(Impulse.kr(1),0,Drand.new([0.3,0.2,0.1],inf)),0,0.03,1), startPos: 44100*sp, doneAction: 2);
	Out.ar(out, Pan2.ar(snd * Lag.kr(vol,5)* Line.kr(0,1,3)))
}).send(s);

SynthDef("background2", {|bufnum, out, vol=1.0, rate=1.0, sp=0|
	var snd;
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum)*Lag.kr(rate, 10), startPos: 44100*sp, doneAction: 2);
	Out.ar(out, snd * Lag.kr(vol,1));
}).send(s);

SynthDef("background3", {|bufnum, out, vol=1.0, rate=1.0, sp=0|
	var snd;
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum)*Lag.kr(rate, 10), startPos: 44100*sp, doneAction: 2);
	Out.ar(out, snd * Lag.kr(vol,5)* Line.kr(0,1,3));
}).send(s);

SynthDef("background4", {|bufnum, out, vol=1.0, rate=1.0, sp=0|
	var snd, env;
	env = Env.new([1,1,9,1,1,0.7,1],[3,10,1,0.3,2,0.5]);
	snd = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)*Lag.kr(rate, 10)*EnvGen.kr(env), startPos: 44100*sp, doneAction: 2);
	Out.ar(out, Pan2.ar(snd * Lag.kr(vol,5)* Line.kr(0,1,1.6)))
}).send(s);


SynthDef("moxymachine", {|bufnum, out, vol=1.0, time=0.2, rate=1.0, sp=0, gate=1, s1=0, s2=0|
	var snd;
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum)*Lag.kr(rate, 10), startPos: 44100*sp, loop: 1);
	snd = FreqShift.ar(snd, Line.kr(s1,s2,10));
	//snd = snd + Mix.ar(Array.fill(5, {|crap| PitchShift.ar(snd, 0.2, 1 + (crap*0.2)) * 0.2}));
	Out.ar(out, snd * Line.kr(0,vol,time) * EnvGen.kr(Env.asr, gate, doneAction:2));
}).send(s);


SynthDef("horray", {|bufnum, out, vol=1.0, rate=1.0, sp=0|
	var snd, env, env2;
	env = Env.new([1,0.5],[10]);
	env2 = Env.new([1,1,0],[5,5]);
	snd = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)*Lag.kr(rate, 10)*EnvGen.kr(env), startPos: 44100*sp, doneAction: 2);
	Out.ar(out, Pan2.ar(snd * Lag.kr(vol,5)* Line.kr(0,1,0.1) * EnvGen.kr(env2, doneAction: 2)))
}).send(s);
)
Synth.new("horray", [\bufnum, ~horray, \vol, 1.0, \sp, 1.05]);

Synth.new("background4", [\bufnum, ~background4, \vol, 0.8, \sp, 0]);

(
SynthDef("oldy1", {|bufnum, out, da|
	var snd;
	snd = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum) ,doneAction: da);
	snd = BPF.ar(snd, 1000,0.5);
	Out.ar(out, Limiter.ar(Pan2.ar(snd)*5))
}).send(s);

SynthDef("oldy2", {|bufnum, out, da|
	var snd;
	snd = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum) ,doneAction: da);
	snd = BPF.ar(snd, 1000,0.5);
	Out.ar(out, Limiter.ar(Pan2.ar(snd)*5))
}).send(s);
)

(
~story = [Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/0.aiff"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/1.aiff"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/2.aiff"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/3.aiff"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/4.aiff"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/5.1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/6.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/6.1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/8.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/9.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/10.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/11.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/12.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/13.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/14.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/15.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/16.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/16.1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/17.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/18.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/19.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/20.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/21.aif")
];
)
(
~background0 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/background0.aif");
~background1 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/background1.aif");
~background2 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/background2.aif");
~background3 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/background3.aif");
~background4 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/background4.aif");

~garbage = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/garbage/garbage/Bounces/garbage0.aif");
~whip = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/whip.aif");
~trash = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/trash2.aif");
~shortgarbage = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/shortgarbage.aif");
~flip = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/flip.aif");
~encore = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/encore.aif");
~brits = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/brits.aif");
~happyNewYear =  Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/happyNewYear.aif");
~awww = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/aww.aiff");
~freeze = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/freeze.aif");
~horray = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/horray.aiff");
)

(
// moxy!
~moxy = [Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/moxy0.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/moxy1.aif"),
	//Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/moxy2.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/moxy3.aif"),
]
)
~garbage.free
~moxy.do({|foo| foo.free;});
(
Routine.new({
	var mox;
	40.do({|i|
		var rel = (i+1)*0.3;
		var rplus = i * 0.01;
		mox.release(rel);
		mox = Synth.new("moxymachine", [\bufnum, ~moxy[i.mod(~moxy.size)], \out, 0, \vol, 1.0, \rate, 1.0 + rplus , \sp, 4 + 80.rand, \s1, i * 5, \s2, i*20]);
		(1 + 3.0.rand).wait;
	});
}).play;
)
{Pan2.ar(PinkNoise.ar*Line.kr(0,0.2,20))}.play
(
{
    var trate, dur, clk, pos, pan;
    trate = MouseY.kr(8,120,1);
    dur = 12 / trate;
    clk = Impulse.kr(trate);
	    pos = MouseX.kr(0,BufDur.kr(~moxy[1])) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
	//Poll.kr(Impulse.kr(1),dur);
	dur.postln;
	    TGrains.ar(2, clk, ~moxy[1], 1, pos, dur, pan, 0.1);
}.play
)

~horray.free
~story.do({|foo| foo.free;});

(
~toplay = [
	[~story[0],1],
	[~story[1],1],
	[~story[2],1],
	[~garbage,2],
	[~story[3],1],
	[~whip,1],
	[~encore,2],
	[~story[4],1],
	[~story[5],1],
	[~trash,1],
	[~story[6],1],
	[~shortgarbage,2],
	[~story[7],1],
	[~flip,2],
	[~story[8],1],
	[~story[9],1],
	[~story[10],1],
	[~brits,2],
	[~story[11],1],
	[~story[12],1],
	[~story[13],1],
	[~story[14],1],
	[~freeze,2],
	[~story[15],1],
	[~happyNewYear, 2],
	[~story[16],1],
	[~awww, 2],
	[~story[17],1],
	[~happyNewYear, 2],
	[~story[18],1],
	//[~horray,2],
	[~story[19],1],
	[~story[20],1],
	[~story[21],1],
	[~story[22],1],
	[~story[23],1],
];
~gaps = [
	2, // the cleaning lady...
	10, // start
	1, // watch out
	-2.0, // garbage
	0, // unfortunate incident
	0, // whip
	-0.3, // awww kitty
	0, // it worked!
	0, // except...
	0, // trash
	-0.5, // better
	0, // shortgarbage
	0, // after doing it several times
	0, // flip
	0, // prostitution
	4, // it worked!
	0.4, // i bet
	-0.1, // brits
	0.2, // except
	0.4, // what to do
	0.2, // speed of light
	0.0, // worn out
	-3.2, // freeze
	-0.25, // 1003
	0.0, // happy new year
	-0.3, // wait
	0.0, // awww
	-1.3, // 1003 more
	0.0, // happy new year
	0.0, // work
	//0.0, // horray
	0.2, // success
	0.3, // no idea
	0.2, // what to do? thinking
	0.2, // journey
	0.3, // eclipsing all thought

]
)

~gaps[27]
~toplay.size
~gaps.size
Synth.new("oldy1", [\bufnum, ~story[19], \vol, 1]);
Synth.new("oldy1", [\bufnum, ~story[7], \vol, 1]);
Synth.new("oldy2", [\bufnum, ~horray, \vol, 1.0, \sp,1]);
Synth.new("background2", [\bufnum, ~background2, \vol, 1.0, \sp, 8.1]);
Synth.new("background3", [\bufnum, ~background3, \vol, 1.5, \sp, 8.1]);
Synth.new("background4", [\bufnum, ~background4, \vol, 0.8, \sp, 0]);
1.0.min(5)
(
Routine.new({
	var jump = 0;
	var vinyl;
	var alen = 0;
	var background0, background1, background2, background3, background4;
	//
	var speedup = Routine.new({
		var rate = 1.0;
				40.do({
			//rate = rate + (0.05.rand - 0.025);
			rate = rate + (0.05.rand - 0.00);
					background0.set(\rate, rate);
					(1.0 + 3.0.rand).wait;
				});
			});
	var moxify = Routine.new({
				var mox;
				5.wait;
				Routine.new({background4.set(\vol,0);5.wait;background4.free;}).play;
		500.do({|j|
			var rel = (j+1)*0.5;
			var rplus = j * 0.01;
			mox.release(rel);
			mox = Synth.new("moxymachine", [\bufnum, ~moxy[j.mod(~moxy.size)], \out, 0, \vol, 1.0.min(0.75 + (0.01*j)), \time, if (j==0, {4.0},{0.2}), \rate, 1.0 + rplus , \sp, 4 + 80.rand, \s1, j * 5, \s2, j * 20]);
			if (j==0, {6},{(1 + 3.0.rand)}).wait;
	});
});
	//
	/*var arabia = Routine.new({
		//
			});*/
	vinyl = Synth.new("vinylCrackling", [\out, 0, \vol, 0.6]);
	~gaps.size.do({|ii|
		var i = ii + jump;
		(alen + ~gaps[i]).wait;

		Synth.new("oldy"++~toplay[i][1],[\bufnum, ~toplay[i][0], \out, 0, \da, 2]);
		//after
		//
		if (i == 0, { // start music
			Routine.new({
				2.wait;
				background0=Synth.new("background0", [\bufnum, ~background0, \vol, 0.6]);
				9.wait;
				speedup.play;
			}).play;
		});
		//
		if (i == 4, { // asia
			Routine.new({
				speedup.stop;
			3.wait;
			Routine.new({background0.set(\vol,0);5.wait;background0.free;}).play;
			background1=Synth.new("background1", [\bufnum, ~background1, \vol, 1.5, \sp, 10]);
				//arabia.play;
			}).play;
		});
		//
		if (i == 14, { // prostitute
			Routine.new({
				~toplay[14][0].duration.wait; // kinda hackish
				vinyl.free;
				background1.free;
				4.wait;
				vinyl = Synth.new("vinylCrackling", [\out, 0, \vol, 0.6]);
				background2 = Synth.new("background2", [\bufnum, ~background2, \vol, 1.0 /*1.0*/, \sp, 8.1]);
				background2.set(\vol, 0.65);
				6.wait;
				background2.set(\vol,0);
				background3 = Synth.new("background3", [\bufnum, ~background3, \vol, 1.5, \sp, 8.1]);
				5.wait;
				background2.free;
			}).play;
		});
		//
		if (i == 18, { // speed of light
			Routine.new({
				2.wait;
				Routine.new({background3.set(\vol,0);5.wait;background3.free;}).play;
				background4 = Synth.new("background4", [\bufnum, ~background4, \vol, 1.5, \sp, 0]);
				2.wait;
				background4.set(\vol, 0.8);
				3.wait;
				background2.free;
			}).play;
		});
		if (i == 29, { // horray
			Routine.new({
				0.6.wait;
				Synth.new("horray", [\bufnum, ~horray, \vol, 1.0, \sp, 1.05]);
			}).play;
		});
		if (i == 30, { // success
			moxify.play;
		});
		if (i==(~toplay.size-1), {
			//Routine.new({(~toplay[i][0].duration - 0.3).wait;moxify.stop;Server.all.do(_.freeAll)}).play;
		});

		alen = ~toplay[i][0].duration;
	});
}).play;
)
//s.sendMsg("/n_free", 1001);

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/menage/theCleaningLady9.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}
