s = Server.local
s.boot


SynthDef(\dustynoise, {|gambit=300, pole=500, dust=1|

	Out.ar(0, Pan2.ar(
		RLPF.ar(WhiteNoise.ar(Demand.kr(Dust.kr(dust), 0, Dseq([1,0], inf))), abs(SinOsc.ar(SinOsc.kr(0.04, 0, 0.04, 0.06), 0, gambit, pole)), 1)
	));
}
)
.play(s);
//.writeDefFile;


SynthDef(\noise, {|gambit=300, pole=500|

	Out.ar(0, Pan2.ar(
		RLPF.ar(WhiteNoise.ar, abs(SinOsc.ar(SinOsc.kr(0.04, 0, 0.04, 0.06), 0, gambit, pole)), 1)
	));
}
)
.play(s);
//.writeDefFile;

// 600, 1500


//Demand.kr(Dust.ar(0.25), 0, Drand([0,0.5]))

SynthDef(\electricity, {|a1=5000, a2=600, a3=1200, dust=1|

	Out.ar(0,Pan2.ar(
		Normalizer.ar(
		CombC.ar(
			HPF.ar((WhiteNoise.ar(0.3) + SinOsc.ar(a1, mul: 1))*SinOsc.ar(a2)*Saw.ar(a3), 1300)
			, decaytime: 2),

			Demand.kr(Dust.kr(dust), 0, Dseq([0,0.5], inf)))


	));
})
.play(s);
//.writeDefFile;

// 400 100 120 1

SynthDef(\jumpy, {|dust=10|
Out.ar(0,
	Pan2.ar(
		Normalizer.ar(
		CombC.ar(
				HPF.ar((WhiteNoise.ar(0.3) + SinOsc.ar(Demand.kr(Dust.kr(1), 0, Dseq([5000,402,1050,397],inf)), mul: 1))*SinOsc.ar(Demand.kr(Dust.kr(1), 0, Dseq([100,215,672,1211],inf)))*Saw.ar(Demand.kr(Dust.kr(1), 0, Dseq([120,1015,2776,3020],inf))), 1300)
			, decaytime: 2),

			Demand.kr(Dust.kr(dust), 0, Dseq([0,0.5], inf)))


	));
})
.play(s);
//.writeDefFile;
"a"++1
(
var a1, a2, a3, dust, f, o, name, gambit, pole;
a1=1000;
a2=8000;
a3=100;
dust=10;
g = [
    [0.0, [\s_new, \electricity, 1000, 0, 0, \a1, a1, \a2, a2, \a3, a3, \dust, dust]],
	[180.0, [\n_free, 1000]],
    [180.0, [\c_set, 0, 0]] // finish
    ];
o = ServerOptions.new.numOutputBusChannels = 2; // mono output
name = "electricity-"++a1++"-"++a2++"-"++a3++"-"++dust;
name.postln;
Score.recordNRT(g, name, name++".aiff", options: o); // synthesize
)

(
var a1, a2, a3, dust, f, o, name, gambit, pole;
gambit=300;
pole=500;
dust=10;
g = [
	[0.0, [\s_new, \dustynoise, 1000, 0, 0, \gambit, gambit, \pole, pole, \dust, dust]],
	[180.0, [\n_free, 1000]],
    [180.0, [\c_set, 0, 0]] // finish
    ];
o = ServerOptions.new.numOutputBusChannels = 2; // mono output
name = "dustynoise-"++gambit++"-"++pole++"-"++dust;
name.postln;
Score.recordNRT(g, name, name++".aiff", options: o); // synthesize
)