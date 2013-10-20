(
z = SynthDef(\src, {
	var start = 0.01;
	var end = 1;
	var dur = 7;
	var ugen = Line;
    Out.ar(0,
        FreeVerb.ar(
            PlayBuf.ar(2,b,1), // mono src
            ugen.kr(start,end,dur), // mix 0-1
            ugen.kr(start,end,dur), // room 0-1
			            ugen.kr(start,end,dur) // damp 0-1 duh
        ) ! 2 // fan out...
    );
}).play
)

s.reboot;
s.quit;
thisProcess.platform.recordingsDir;
Server.default.makeGui
(
Server.killAll;
s = Server.local;
s.boot;
)
(
z = SynthDef(\jeParsEnVacances, {
	var start = 0.7;
	var end = 0.7;
	var dur = 7;
	var ugen = Line;
	var snd = PlayBuf.ar(1,b,1);
	var snd2 = PitchShift.ar(snd, 0.2, 0.7);
	Out.ar(0,Pan2.ar(snd + (snd2*0.4) + MonoGrain.ar(snd, 0.1, 10), 0.0));
}).play
)

b=Buffer.read(s, "/Users/mikesolomon/Downloads/131183__ongitak__b10-wobble-lfo-3.wav");

(
z = [Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/clap.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/closedHH.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/kick.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/kick2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/sfx.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/sfx2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/sfx3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/sfx4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/snare.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/strike.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/tom.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/splits/unsaned.aif")
];

)

(
{
	var arr = Array.fill(12, {|i|
		PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]));
	});
	Out.ar(0, Mix.ar(arr), 0.2, 20);
}.play
)

(
{
	var snd0 = PlayBuf.ar(2,z[0],BufRateScale.kr(z[0]) * SinOsc.kr(2, 0, 0.3, 1.3), Impulse.kr(0.2));
	var snd1 = PlayBuf.ar(2,z[1],BufRateScale.kr(z[1]) * SinOsc.kr(2.1, 0, 0.4, 1.3), Impulse.kr(0.1));
	var snd2 = PlayBuf.ar(2,z[2],BufRateScale.kr(z[2]) * SinOsc.kr(1.05, 0, 0.05, 1.3), Impulse.kr(0.25));
	var snd3 = PlayBuf.ar(2,z[3],BufRateScale.kr(z[3]) * SinOsc.kr(2.4, 0, 0.2, 1.3), Impulse.kr(0.005));
	var snd4 = PlayBuf.ar(2,z[4],BufRateScale.kr(z[4]) * SinOsc.kr(2.6, 0, 0.6, 1.3), Impulse.kr(0.05));
	var snd5 = PlayBuf.ar(2,z[5],BufRateScale.kr(z[5]) * SinOsc.kr(3, 0, 0.35, 1.3), Impulse.kr(0.0));
	var snd6 = PlayBuf.ar(2,z[6],BufRateScale.kr(z[6]) * SinOsc.kr(4.9, 0, 0.1, 1.3), Impulse.kr(1));
	var snd7 = PlayBuf.ar(2,z[7],BufRateScale.kr(z[7]) * SinOsc.kr(2, 0, 0.3, 1.3), Impulse.kr(0.8));
	var snd8 = PlayBuf.ar(2,z[8],BufRateScale.kr(z[8]) * SinOsc.kr(2.1, 0, 0.4, 1.3), Impulse.kr(0.125));
	var snd9 = PlayBuf.ar(2,z[9],BufRateScale.kr(z[9]) * SinOsc.kr(1.05, 0, 0.05, 1.3), Impulse.kr(2));
	var snd10 = PlayBuf.ar(2,z[10],BufRateScale.kr(z[10]) * SinOsc.kr(2.4, 0, 0.2, 1.3), Impulse.kr(0.01));
	var snd11 = PlayBuf.ar(2,z[11],BufRateScale.kr(z[11]) * SinOsc.kr(2.6, 0, 0.6, 1.3), Impulse.kr(0.001));
	Out.ar(0, snd0 + snd1 + snd2 + snd3 + snd4 + snd5 + snd6 + snd7 + snd8 + snd9 + snd10 + snd11);
}.play
)

(
{
	var arr = Array.fill(12, {|i|
		var freq = 2 + (i * 0.2);
		var mul = 0.05 + (i * 0.05);
		var add = 0.75 + (i * 0.15);
		var trig = i * 0.1;
		PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]) * SinOsc.kr(freq, 0, mul, add), Impulse.kr(trig));
	});
	Out.ar(0, MonoGrain.ar(Mix.ar(arr), 0.2, 20)
	);
}.play
)


(
{
	var arr = Array.fill(12, {|i|
		var imp = 0.1;
		var freq = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(12, { |j| 2 + (j * 0.2) }), inf));
		var mul = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(12, { |j| 0.05 + (j * 0.05) }), inf));
		var add = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(12, { |j| 0.75 + (j * 0.15) }), inf));
		var trig = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(12, { |j| 0.00 + (j * 0.1) }), inf));
		var snd = PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]) * SinOsc.kr(freq, 0, mul, add), Impulse.kr(trig));
		snd*Demand.kr(Impulse.kr(Demand.kr(Impulse.kr(100), 0, Dseq([0.2,1,2,0.5,5,0.3,2], inf))), 0, Drand([0,1], inf));
	});
	Out.ar(0, MonoGrain.ar(Mix.ar(arr), 0.2, 20)
	);
}.play
)


(
play{ //PitchShift.ar(
	PlayBuf.ar(2,b,BufRateScale.kr(b)*Line.kr(0.7,0.3,5));
	//, 0.2, 1.0)
};
)


s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/lePatronPart/dubWobbb.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

