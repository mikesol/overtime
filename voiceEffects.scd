s.reboot;
s.quit;
thisProcess.platform.recordingsDir;
Server.default.makeGui
(
Server.killAll;
s = Server.local;
s.boot;
)


{Vocoder.ar(Saw.ar(400,4),AudioIn.ar(1),56)}.play;
MonoGrain //
Tartini //
GrainBuf //
PitchShift //
Warp1 // another pitch shifter
WarpOverlap // ditto
WarpZ // ditto
FreqShift //
CombL // can spin stuff off in comb delays

/*
From memory: The pitch of my vocal was tracked with Tartini. The pitch shifter was locked to a particular base frequency based on the Tartini tracking. I used demand rate ugens to arpeggiate that pitch shift frequency. My dry vocal was also ring modulated with a sine wave one octave below the pitch tracked by Tartinti. I'm mostly saying "oooooooooohhhhaaaaaaahhhh" with a fair amount of breathiness (lots of technique, to master, trust me). All of that was sent through Freqtweak, with freq-dependent delay.
*/

LPCAna // creates LPC analysis file
LPCAnalyzer // analysis in real time, used to filter source
LPCError // experimental generating interesting errors
LPCFile // loads LPC analysis file
LPCSynth // synthesizes from file
LPCVals // returns pitch, etc from file

// phase vocode
FFT
IFFT
PV_BrickWall // etc, always PV_
(

~mypath = "/Users/mikesolomon/Documents/Compositions/madrigali/demoisellesReal/Bounces/marieSnippet.aif";
//~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/beatbox.aif";
//~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/leaderex/Bounces/leaderex.aif";
//~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/stAbbeR.aif";
//~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/overtime/Bounces/ryanSolo.aif";
//~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/OVERTIME.aif";
//~mypath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/doot.aif";

b = Buffer.read(s,~mypath);
~lite = Buffer.readChannel(s,~mypath, channels: 0);
z = Buffer.alloc(s, 44100 * 60.0, 1); // a 60 second 1 channel Buffer
~house = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/house0.aif");
~psb = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/packSandbox1.aif");
)
//test
//PlayBuf.ar(2,b,1)

play{PlayBuf.ar(2,b,1)};

play{SoundIn.ar}

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/overtime/ryanTest.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.
play{EnvGen.kr(Env.new([1.5,0.8,0.0],[0.4,8]), 1)*PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, Line.kr(0.5,0.1,8))}
// basic pitch shiftery
play{PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(100,0,0.4,1.2))};
// w orig
play{(PlayBuf.ar(2,b,1)*0.5) + PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(100,0,0.4,1.2))};


(
play{(PlayBuf.ar(2,b,1)*0.5) + PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(100,0,0.4,1.2))

+ PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, 0.8)
};
)



play{EnvGen.kr(Env.new([0.0,1.0,1.0],[2,6]), 1)*PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(0.1,1.5pi,1.2,2.65))};

play{PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(0,0,0.2,0.8))};

// with orig..
play{PlayBuf.ar(2,b,1) + PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(0,0,0.2,0.8))};

// arpeggiate
play{PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, Demand.kr(Impulse.kr(4),0,Dseq([1.1,1.6,2.1,2.6],inf)))};
play{Pan2.ar(PitchShift.ar(SoundIn.ar, 0.2, Demand.kr(Impulse.kr(4),0,Dseq([1.1,1.6,2.1,2.6],inf))))};

//ugggghhhh
(
SynthDef(\leaderex,
{  arg bufnum=b, out=0;
	var base, sound0, sound1, sound2, sound3;
	base = PlayBuf.ar(2,bufnum,1, doneAction: 2);
	sound0 = PitchShift.ar(base, 0.2, SinOsc.kr(100,0,0.4,1.2));
		sound1 = 0;//PitchShift.ar(base, 0.2, 0.85);
		Out.ar(out, Limiter.ar(((sound0 * 0.5) + sound1)*4));
}).writeDefFile;
)

(
    var synar = [];
    var opts = ServerOptions.new.numOutputBusChannels = 2;
    opts.memSize = 2.pow(16);
    opts.maxNodes = 2.pow(13);
    // CHECK THE READ CALL
    	synar = synar ++ [[0.0, [\b_alloc, 0, 44100*95, 2]],
		[0.0, [\b_read, i, ~mypath]]];
    synar = synar ++ [[0.0, [\s_new, \leaderex, 1000, 0, 0, \bufnum, 0, \out, 0]]];
synar = synar ++ [[95, [\c_set, 0, 0]]];
    Score.recordNRT(synar, "pleasework.osc", "leaderex2.aiff", options: opts);

)


/// wooot!!!!
(
SynthDef(\foobar,
{
	var base, baseL, sound0, sound1, sound2, sound3;
	base = PlayBuf.ar(2,b,1);
	baseL = PlayBuf.ar(1, ~lite.bufnum, BufRateScale.kr(~lite.bufnum), doneAction: 2);

		//base = SoundIn.ar;
		//baseL = base;
	sound0 = PitchShift.ar(base, 0.2, Demand.kr(Impulse.kr(4),0,Dseq([1.1,1.6,2.1,2.6],inf)));
	sound1 = base;
	sound2 = LPF.ar(PitchShift.ar(base, 0.2, 0.4), 150);
	sound3 = LPCAnalyzer.ar(baseL,Impulse.ar(Demand.kr(Impulse.kr(0.2),0,Dseq([440,300,540,200,430,850],inf)),0,0.2), 256, 50).dup;
		Out.ar(0,sound0 + sound1 + (sound2*1.6) + (sound3*1.0));
}).play;
)
/**/
//play{PitchShift.ar(SoundIn.ar(0), 0.2, Demand.kr(Impulse.kr(4),0,Dseq([0.4,0.5,0.6,0.7,0.9],inf)))};

// basic frequency shiftery
play{FreqShift.ar(PlayBuf.ar(2,b,1), SinOsc.kr(Line.kr(10,200,b.duration),0,50,100))};

// granulation
play{MonoGrain.ar(PlayBuf.ar(2,b,1), 0.03, 20)};

play{MonoGrain.ar(PitchShift.ar(PlayBuf.ar(2,b,1), 0.2, SinOsc.kr(100,0,0.4,1.2)), SinOsc.kr(20,0,0.005, 0.045), SinOsc.kr(10,0,5,15))};

/**/
//play{MonoGrain.ar(PitchShift.ar(SoundIn.ar(0), 0.2, SinOsc.kr(100,0,0.4,1.2)), SinOsc.kr(20,0,0.005, 0.045), SinOsc.kr(10,0,5,15))};

// tracking
// creates beats and gurgling...cool!
play{q=Tartini.kr(PlayBuf.ar(2,b,1, doneAction:2));HPF.ar(SinOsc.ar([q,q*2.1,q*3.05,q*4.5,q*5, q*6.06], 0, 0.4, 0),200)};

// electronica
play{AllpassC.ar(SinOsc.ar(Tartini.kr(PlayBuf.ar(2,b,1, doneAction:2))).tanh,0.4,TExpRand.ar(2e-4, 0.4,Impulse.ar(8)).round([2e-3,4e-3]),2).clip2};// #supercollider with bass please...

// gurgle
play{PlayBuf.ar(2,b,1)*SinOsc.ar(Tartini.kr(PlayBuf.ar(2,b,1)))};

// cool lf saw
play{HPF.ar(Mix.ar(LFSaw.ar(SinOsc.kr(Array.rand(3,0.1,0.5),0,10,[1,1.1,1.5,1.78,2.45,6.7]*Tartini.kr(PlayBuf.ar(2,b,1, doneAction: 2))),0,0.3, 0.2)), 100).dup};

// mine
play{Normalizer.ar(BPF.ar(PlayBuf.ar(2,b,1),SinOsc.kr(1,0,Array.geom(16,10,1.5),Array.geom(16,120,1.5)),0.005,1).sum, 0.8, 0.01).dup} // kind of EZ resonator / vocoder for the mic #supercollider

play{Normalizer.ar(BPF.ar(PitchShift.ar(PlayBuf.ar(2,b,1),0.2,Line.kr(1.1,1.4,10)),SinOsc.kr(1,0,Array.geom(16,10,1.5),Array.geom(16,120,1.5)),0.005,1).sum, 0.8, 0.01).dup} // kind of EZ resonator / vocoder for the mic #supercollider

// mine
// double up sins, double the fun!
play{Normalizer.ar(BPF.ar(PlayBuf.ar(2,b,1),SinOsc.kr(SinOsc.kr(1,0,4,5),0,Array.geom(16,10,1.5),Array.geom(16,120,1.5)),0.005,1).sum,0.8,0.01).dup} // kind of EZ resonator / vocoder for the mic #supercollider

// comb suite
play{CombC.ar(PlayBuf.ar(2,b,1).softclip,1,1/Saw.kr(0.1,0,30,90),1).dup}

// with pitch shift and saw wave slinky
play{CombC.ar(PitchShift.ar(PlayBuf.ar(2,b,1).softclip, 0.2, Line.kr(0.5,2,10)),1,1/Saw.kr(0.1,0,30,90),1).dup}

// with sine wav slinky
play{CombC.ar(PlayBuf.ar(2,b,1).softclip,1,1/SinOsc.kr([0.1,1],0,30,90),1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider

// with double sin slinky
play{CombC.ar(PlayBuf.ar(2,b,1).softclip,1,1/SinOsc.kr(SinOsc.kr(1,0,[0.1,1]),0,30,90),1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider

// with pitch shift and double sin slinky
play{CombC.ar(PitchShift.ar(PlayBuf.ar(2,b,1).softclip, 0.2, SinOsc.kr(10,0,0.05,0.7)),1,1/SinOsc.kr(SinOsc.kr(1,0,[0.1,1]),0,30,90),1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider


// 1 c

play{Normalizer.ar(BPF.ar(PlayBuf.ar(1,b,1),SinOsc.kr(SinOsc.kr(1,0,4,5),0,Array.geom(16,10,1.5),Array.geom(16,120,1.5)),0.005,1).sum,0.8,0.01).dup} // kind of EZ resonator / vocoder for the mic #supercollider

play{CombC.ar(PitchShift.ar(PlayBuf.ar(1,b,1).softclip, 0.2, SinOsc.kr(10,0,0.05,0.7)),1,1/SinOsc.kr(SinOsc.kr(1,0,[0.1,1]),0,30,90),1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider

(
// using marie to control dubstep
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0, marie = 0 |
    var in, amp, pitch, rate;
	in = PlayBuf.ar(2,marie,BufRateScale.kr(marie), doneAction:2);
	amp = Amplitude.ar(in);
	//pitch = Pitch.kr(in, 100, 40, 800);
	pitch = Tartini.kr(in);
	rate = Lag2.ar(1 + (((pitch - 220)/110)*amp), 0.2);
	rate.poll(Impulse.ar(20), "value");
    Out.ar(out,
        PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * rate, 1, 0, 1)
    )
}).play(s, [\out, 0, \bufnum, ~house, \marie, b]);
)

// in hou$e dubstep PIRATTTEEE arrr
(
{
        var trig, note, son, sweep, swr;

	// one impulse per second
     trig = Impulse.kr(1);

	// we have a random note every second. notes will never repeat back to back
        note = Tartini.kr(PlayBuf.ar(2,b,1, doneAction:2));

	// we have a random number in the list below, can be back to back
        swr = Demand.kr(trig, 0, Drand([0.5, 1, 2, 3, 4, 6], inf));
	// using the number above, which will be slow, and we have it oscillating exponentially
	// between 40 and 3000
        sweep = LFTri.ar(swr).exprange(40, 3000);

	// add together three really close saw waves using the note. likely creates some sorta beating
        son = LFSaw.ar(note * [0.99, 1, 1.01]).sum;
	// filter low pass with the sweep (remembering this is from 40 to 3000)
        son = LPF.ar(son, sweep);
	// normalizes
        son = Normalizer.ar(son);
	// adds a filtered version with a q of 1500
        son = son + BPF.ar(son, 1500, 2);

        //////// special flavours:
        // hi manster
        son = Select.ar(TRand.kr(trig: trig) < 0.4, [son, HPF.ar(son, 2000) * 4]);
        // sweep manster
        son = Select.ar(TRand.kr(trig: trig) < 0.3, [son, HPF.ar(son,
sweep*1.5) * 4]);
        // decimate
        son = Select.ar(TRand.kr(trig: trig) < 0.2, [son, son.round(0.1)]);

     son = son + GVerb.ar(son, 11, 0.5, 0.7, mul: 0.2);
        son = (son * 2).sin;

     son = son + SinOsc.ar(note,0,LFTri.ar(swr,mul:2,add:1)).tanh;


     ((son*0.5)/*+bd+sd*/).tanh;
}.play
)


// record and granulate (w/ shift)
(
SynthDef(\buf_grain_test, {arg wrtbuf, sndbuf, inbuf;
    var money, rplay, play, line, pan, env, freqdev, grainlen, impulz;

	grainlen = LFNoise1.kr(10).range(0.05,0.1);//0.1;
	impulz = LFNoise1.kr(10).range(8,15);//10
	money = BufDur.kr(inbuf)/BufDur.kr(wrtbuf);
	line = Line.kr(0,1*money,BufDur.kr(inbuf));
	rplay = PlayBuf.ar(2,inbuf,1, doneAction: 2);
	play = rplay.sum;
	RecordBuf.ar(play, wrtbuf, loop: 0);
	    pan = SinOsc.kr(Demand.kr(Impulse.kr(1),0,Drand([0.1,1,5],inf)));//MouseX.kr(-1, 1);
	// multiplies by the line to avoid writing problems...will suck in beginning...
    Out.ar(0, rplay + PitchShift.ar(rplay, 0.2, SinOsc.kr(100,0,0.4,1.2)) +
        GrainBuf.ar(2, Impulse.kr(impulz), grainlen, sndbuf, LFNoise1.kr.range(0.5, 2),
			(line - (grainlen*money/1) - (LFNoise2.kr(0.01,0.2*money))).clip(0,line), 2, pan))
    }).play(s, [\wrtbuf, z, \sndbuf, z, \inbuf, b]);

)

(
z.free;
z = Buffer.alloc(s, 44100 * 60.0, 1); // a 60 second 1 channel Buffer

)


// PvvvVVVV!!!

(
m = Buffer.alloc(s,2048,1);
n = Buffer.alloc(s,2048,1);
)

(
SynthDef("help-magSmear2", { arg out=0, bufnum=0, soundBufnum=2;
    var in, chain;
    in = PlayBuf.ar(1, soundBufnum, BufRateScale.kr(soundBufnum), doneAction: 2);
    chain = FFT(bufnum, in);
    chain = PV_MagSmear(chain, SinOsc.kr(0.33).range(20,60));
    Out.ar(out, 0.8 * IFFT(chain).dup);
}).play(s,[\out, 0, \bufnum, m.bufnum, \soundBufnum, ~lite.bufnum]);
)


(
SynthDef("help-magSmear2", { arg out=0, bufnum=0, soundBufnum=2;
    var in, chain;
    in = PlayBuf.ar(1, soundBufnum, BufRateScale.kr(soundBufnum), doneAction: 2);
    chain = FFT(bufnum, in);
    chain = PV_MagSmear(chain, 200);
    Out.ar(out, 0.8 * IFFT(chain).dup);
}).play(s,[\out, 0, \bufnum, m.bufnum, \soundBufnum, ~lite.bufnum]);
)



m.free; n.free;


// stretch
(
SynthDef("help-magStretch", { arg out=0, bufnum=0;
    var in, chain, sbfnm;

	sbfnm = ~lite.bufnum;
    in = PlayBuf.ar(1, sbfnm, BufRateScale.kr(sbfnm), doneAction: 2);
    chain = FFT(LocalBuf(2048), in);
	    chain = PV_MagShift(chain, SinOsc.kr(0.1,0.3pi).exprange(0.5,2.0) );
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play(s);
)

// shift
(
SynthDef("help-magStretch", { arg out=0, bufnum=0;
    var in, chain, sbfnm;

	sbfnm = ~lite.bufnum;
    in = PlayBuf.ar(1, sbfnm, BufRateScale.kr(sbfnm), doneAction: 2);
    chain = FFT(LocalBuf(2048), in);
	    chain = PV_MagShift(chain, 1, LFNoise1.kr(0.1).range(-128,60) );
    Out.ar(out, 0.8 * IFFT(chain).dup);
}).play(s);
)


// stretch and shift
(
SynthDef("help-magStretch", { arg out=0, bufnum=0;
    var in, chain, sbfnm;

	sbfnm = ~lite.bufnum;
    in = PlayBuf.ar(1, sbfnm, BufRateScale.kr(sbfnm), doneAction: 2);
    chain = FFT(LocalBuf(2048), in);
	    chain = PV_MagShift(chain, SinOsc.kr(1,0.3pi).exprange(0.5,2.0), LFNoise1.kr(0.1).range(-128,60) );
    Out.ar(out, 0.7 * IFFT(chain).dup);
}).play(s);
)


// the BIN BUDDy of aBovEE

// stretch
(
SynthDef("help-magStretch", { arg out=0, bufnum=0;
    var in, chain, sbfnm;

	sbfnm = ~lite.bufnum;
    in = PlayBuf.ar(1, sbfnm, BufRateScale.kr(sbfnm), doneAction: 2);
    chain = FFT(LocalBuf(2048), in);
	    chain = PV_BinShift(chain, SinOsc.kr(0.1,0.3pi).exprange(0.5,2.0) );
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play(s);
)

// shift
(
SynthDef("help-magStretch", { arg out=0, bufnum=0;
    var in, chain, sbfnm;

	sbfnm = ~lite.bufnum;
    in = PlayBuf.ar(1, sbfnm, BufRateScale.kr(sbfnm), doneAction: 2);
    chain = FFT(LocalBuf(2048), in);
	    chain = PV_BinShift(chain, 1, LFNoise1.kr(0.1).range(-128,60) );
    Out.ar(out, 0.7 * IFFT(chain).dup);
}).play(s);
)

// stretch and shift
(
SynthDef("help-magStretch", { arg out=0, bufnum=0;
    var in, chain, sbfnm;

	sbfnm = ~lite.bufnum;
    in = PlayBuf.ar(1, sbfnm, BufRateScale.kr(sbfnm), doneAction: 2);
    chain = FFT(LocalBuf(2048), in);
	    chain = PV_BinShift(chain, SinOsc.kr(1,0.3pi).exprange(0.5,2.0), LFNoise1.kr(0.1).range(-128,60) );
    Out.ar(out, 0.7 * IFFT(chain).dup);
}).play(s);
)

{LPCAnalyzer.ar(PlayBuf.ar(1, ~lite.bufnum, BufRateScale.kr(~lite.bufnum), doneAction: 2),Impulse.ar(440,0,0.2), 256, 50).dup}.play
{LPCAnalyzer.ar(PlayBuf.ar(1, ~lite.bufnum, BufRateScale.kr(~lite.bufnum), doneAction:  2),SinOsc.ar([1,1.1,1.5,1.78,2.45,6.7]*220,0,0.05), 256, 50)}.play


// NRT !!
Array.fill(8,{(10..400).rand});

Array.fill(8,{Array.fill(8,{15+400.rand})})

play{t=Impulse.kr(14.0/3.0);PlayBuf.ar(2,b,1,t,Demand.kr(t,0,Dseq(1e3*[103,41,162,15,141,52,124,190],inf)))!2}
play{t=Impulse.kr(14.0/3.0);PlayBuf.ar(2,b,1,t,Demand.kr(t,0,Dseq(1e3*Array.fill(8,{15+400.rand}),inf)))!2}
play{t=Impulse.kr(14.0/3.0);PlayBuf.ar(2,b,1,t,Demand.kr(t,0,Dseq(1e3*Array.fill(8,{(Array.fill(8,{15+400.rand})!4).flatten}).flatten,inf)))!2}

play{PlayBuf.ar(2,~psb,1,doneAction: 2)};
s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/voiceEffectSketches/leaderex.wav");
s.record;
	s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}