/* alternate betwixt lots of things doing the same thing
*/

s.reboot;
s.quit;
thisProcess.platform.recordingsDir;
Server.default.makeGui
Server.killAll;
s = Server.local;
s.boot;

ServerOptions.devices
Server.local.options.inDevice_(ServerOptions.devices[3])
Server.local.options.outDevice_(ServerOptions.devices[2])

(
z = [
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/laPause/Bounces/nocturneMarie.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/laPause/Bounces/nocturneMike.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/laPause/Bounces/nocturneRyan.aif"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/laPause/Bounces/nocturneEudes.aif")
]
)

IdentityDictionary
(
a = IdentityDictionary(know: true);
a.put(\foo, { | x | ("the argument is:" + x).postln });
a.foo;
)
Array.fill(10, {|i| if(i.mod(2) == 0,{[0.2]},{[3.2]}).dup((if(i.mod(2) == 0,{10.rand + 1},{[3.rand + 1]})).rand).flatten }).flatten


Array.fill(7, {[0,0,0,1]}) ++ [[1,1]];


{PlayBuf.ar(2,z[0], BufRateScale.kr(z[0]))}.play

TIRand

(
SynthDef(\choraleSimple, {
	var sndN = Array.fill(4, {|i| PlayBuf.ar(2,z[i], BufRateScale.kr(z[i])*SinOsc.kr(0.1,0,0.15,1.05), 1, 0)});
	//var sndN = Array.fill(4, {|i| PlayBuf.ar(2,z[i], BufRateScale.kr(z[i])*SinOsc.kr(0,0,0,1), 1, 0)});
	Out.ar(0, Limiter.ar(
		Mix.ar(sndN)
	)
	);
}).play(s);
)

(
SynthDef(\choraleSimple, {
	var sndN = Array.fill(4, {|i| PlayBuf.ar(2,z[i], BufRateScale.kr(z[i])*SinOsc.kr(0.1,(i*0.5pi),0.15,1.05), 1, 0)});
	Out.ar(0, Limiter.ar(
		Mix.ar(sndN)
	)
	);
}).play(s);
)

(
SynthDef(\choraleSingle, {|bufnum|
	var sndN = PlayBuf.ar(2,bufnum, BufRateScale.kr(bufnum)*SinOsc.kr(0.05,0,0.15,1.05), 1, 0);
	Out.ar(0, sndN);
}).writeDefFile;
)

(
["Marie","Mike","Ryan","Eudes"].do({|name|
g = [
	[0.0, [\b_alloc, 5, 44100*110, 2]],
	[0.0, [\b_read, 5, "/Users/mikesolomon/Documents/Compositions/overtime/laPause/Bounces/nocturne"++name++".aif"]],
    [0.0, [\s_new, \choraleSingle, 1000, 0, 0, \bufnum, 5]],
    [110, [\c_set, 0, 0]] // finish
    ];
o = ServerOptions.new.numOutputBusChannels = 2; // mono output
Score.recordNRT(g, "temp"++name++"-oscFile", "nocturne"++name++"NRT.aiff", options: o)
});
)


(
SynthDef(\chorale, { |startpos = 0, trigS = 1, trigN = 1, trigF = 1, vS = 0, vN = 1, vF = 0|
	var sndS = Array.fill(4, {|i| PlayBuf.ar(2,z[i], BufRateScale.kr(z[i])*0.8, trigS, startpos)}) * Lag.kr(vS);
	var sndN = Array.fill(4, {|i| PlayBuf.ar(2,z[i], BufRateScale.kr(z[i])*1.0, trigN, startpos)}) * Lag.kr(vN);
	var sndF = Array.fill(4, {|i| PlayBuf.ar(2,z[i], BufRateScale.kr(z[i])*1.2, trigF, startpos)}) * Lag.kr(vF);
	Out.ar(0, Limiter.ar(Mix.ar(sndS+sndN+sndF)));
}).send(s);
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/chorale-005-015-105.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

(
Routine({
	var total = 0.0;
	var place = 0.0;
	var chorale = Synth.new(\chorale);
	var trigs = [\trigS, \trigN, \trigF];
	var vs = [\vS,\vN,\vF];
	var idx = 2.rand;
	var scratch = 0;
	Routine({[9.0,1.5,6.0,1.5,1.0,7.0,6.0,4.0,3.0].do({|n,i|
		var tmp = 2.rand;
		while ({tmp == idx}, { tmp = 2.rand; });
		idx = tmp;

		(n - 0.01).wait;
		trigs.do({|t| chorale.set(t, 0);});
		0.01.wait;

		scratch = 5.rand;
		scratch = if (place + n - scratch < 0, { 0 } , { scratch });
		total = total + n;
		place = place + n - scratch;
		chorale.set(\startpos, place * 44100);
		trigs.do({|trig, j| if (j != idx, {chorale.set(trig, 1)});});
		vs.do({|vol, j| chorale.set(vol, if(j == idx, {1}, {0}));});
	})}).play;
}).play;
)



(
Routine({
	var kludge = Array.fill(z.size, {|i|i}).scramble;
	var arr = Array.fill(z.size, {|i| Synth.new(\foobar, [\bufnum, z[kludge[i]], \vol, 0, \scale, 1 + (i*0.01)])});
	10000.do({|i|
		arr.size.do({ |j|
			arr[j].set(\vol, if(i.mod(arr.size) == j, {j.postln; 1}, {0}));
			//arr[j].set(\startpos, (44100*4).rand);
			//if (i.mod(100) == 43, {arr[j].set(\startpos, (44100*4).rand)});
			//arr[j].set(\trig, (0.1 + (0.3.rand)).rand);
			//arr[j].set(\trig, 20.rand + 5);
			//arr[j].set(\trig, 0);
		});
		//(60.0/(160 * 2)).wait;
		0.1.wait;
		//(10.rand * 0.1).wait;
	});

}).play;
)

(
{
	var orig = SoundIn.ar(0);
	var total = 3;
	MonoGrain.ar(Pan2.ar(Mix.ar(Array.fill(total, {|i| PitchShift.ar(orig, 0.2, 0.9 + (i * 0.1))*(1.0)}))), 0.2, 20);
}.play
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/fastShit2.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.
