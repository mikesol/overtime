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

)

(
SynthDef("boring", {|bufnum, rate, vol=1, ramp=0.01, offset=0|
	var snd, env;
	env = Env.new([0,vol],[ramp]);
	snd = PlayBuf.ar(2,bufnum,BufRateScale.kr(bufnum) * rate, startPos: offset * BufSampleRate.kr(bufnum), doneAction: 2);
	Out.ar(0, snd * EnvGen.kr(env));
}).send;
)

Synth.new("boring", [\bufnum, ~cat, \rate, 1, \vol, 1, \ramp, 0, \offset, 0])