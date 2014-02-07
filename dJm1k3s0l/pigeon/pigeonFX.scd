s = Server.local;
s.boot;
s.quit;


(
~cat = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/cat.aif");
~cow = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/cow.aif");
~duck = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/duck.aif");
~goose = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/goose.aif");
~hens = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/hens.aif");
~hippo = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/hippo.aif");
~lion0 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/lion0.aif");
~lion1 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/lion1.aif");
~pigeon0 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/pigeon0.aif");
~pigeon1 = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/pigeon1.aif");
~robin = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/robin.aif");
~rooster = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/rooster.aif");
~turkey = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/turkey.aif");
~wolf = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/wolf.aif");
m = Buffer.alloc(s,2048,1);
n = Buffer.alloc(s,2048,1);
)

(

)

(
SynthDef.new("boring", {|bufnum, rate, vol=1, ramp=0.01, offset=0|
	var snd, env;
	env = Env.new([0,vol],[ramp]);
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum) * rate, startPos: offset * BufSampleRate.kr(bufnum), doneAction: 2);
	Out.ar(0, snd * EnvGen.kr(env));
}).send(s);

SynthDef.new("pshift", {|bufnum, rate, pitch, vol=1, ramp=0.01, offset=0|
	var snd, env;
	env = Env.new([0,vol],[ramp]);
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum) * rate, startPos: offset * BufSampleRate.kr(bufnum), doneAction: 2);
	snd = PitchShift.ar(snd, 0.2, pitch);
	Out.ar(0, snd * EnvGen.kr(env));
}).send(s);

// comby slinky
SynthDef.new("comby", {|bufnum, width=30, height=90|
	Out.ar(0, CombC.ar(PitchShift.ar(PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum),doneAction: 2).softclip, 0.2, SinOsc.kr(10,0,0.05,0.7)),1,1/SinOsc.kr(SinOsc.kr(1,0,[0.1,1]),0,width,height),1).dup);
}).send(s);

SynthDef.new("grainy", { |bufnum|

		Out.ar(0,MonoGrain.ar(PitchShift.ar(PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum),doneAction: 2), 0.2, SinOsc.kr(100,0,0.4,1.2)), SinOsc.kr(20,0,0.005, 0.045), SinOsc.kr(10,0,5,15)));
}).send(s);

SynthDef("help-magSmear2", { arg out=0, bufnum=0, soundBufnum=2, r0=20, r1=60;
    var in, chain;
    in = PlayBuf.ar(1, soundBufnum, BufRateScale.kr(soundBufnum), doneAction: 2);
    chain = FFT(bufnum, in);
    chain = PV_MagSmear(chain, SinOsc.kr(0.33).range(r0,r1));
    Out.ar(out, 0.8 * IFFT(chain).dup);
}).send(s);

~chord = {|buffy, rate  ...vals|
	vals.do({|i|
		Synth.new("pshift", [\bufnum, buffy, \rate, 1, \pitch, i, \vol, 1.0/vals.size, \rate, rate]);
	});
}

)

~chord.(~duck, 1, 0.75, 0.5);
~chord.(~rooster, 0.5, 0.5, 0.4);

Synth.new("boring", [\bufnum, ~cat, \rate, 1, \vol, 1, \ramp, 0, \offset, 0])

// BIG pigeon
~badpussy = Synth.new("boring", [\bufnum, ~robin, \rate, 1]);

// fucked up cat !
~badpussy = Synth.new("comby", [\bufnum, ~rooster]);
~badpussy.set(\height, 90)
~badpussy.set(\width, 100)

~badpussy = Synth.new("grainy", [\bufnum, ~turkey]);

~badpussy = Synth.new("help-magSmear2", [\out, 0, \bufnum, m.bufnum, \soundBufnum, ~wolf, \r0, 100, \r1, 200]);


s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/pigeon/birdsong/fuckedUp/crazyWolf2.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}