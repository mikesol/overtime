/* getting slower and faster real quick */
/* lots of instrument changes */

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
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test0.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test10.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test11.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test12.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test13.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test14.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test8.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/volDif/test9.aif")
]
)


Array.fill(10, {|i| if(i.mod(2) == 0,{[0.2]},{[3.2]}).dup((if(i.mod(2) == 0,{10.rand + 1},{[3.rand + 1]})).rand).flatten }).flatten


Array.fill(7, {[0,0,0,1]}) ++ [[1,1]];

(
{
	var hello = Array.fill(20, {|i| if(i.mod(2) == 0,{[0.2]},{[3.2]}).dup((if(i.mod(2) == 0,{10.rand + 1},{[3.rand + 1]})).rand).flatten }).flatten;
	var arr = Array.fill(z.size, {|i|
		var imp = 0.1;
		var sad = Demand.kr(Impulse.kr(0.5), 0, Dseq(hello, inf));
		var freq = Demand.kr(Impulse.kr(0.4), 0, sad + Drand(Array.fill(z.size, { |j| (j * 0.05) }), inf));
		var trig = Demand.kr(Impulse.kr(imp), 0, Drand(Array.fill(z.size, { |j| 0.00 + (j * 0.1) }), inf));
		var snd = PlayBuf.ar(2,z[i], BufRateScale.kr(z[i]) * freq, Impulse.kr(trig));
		snd*Demand.kr(Impulse.kr(Demand.kr(Impulse.kr(100), 0, Dseq([0.2,1,2,0.5,5,0.3,2], inf))), 0, Drand(Demand.kr(Impulse.kr(1), 0, [[0,1], [0,1,1,1], [0,0,0,1], [0,0,0,0,0,0,1], [1,1,1,1,1,1,0]]), inf));
		//snd*Demand.kr(Impulse.kr(Demand.kr(Impulse.kr(100), 0, Dseq([0.2,1,2,0.5,5,0.3,2], inf))), 0, Drand(Demand.kr(Dust.kr(1), 0, Array.fill(7, {[0,0,0,1]}) ++ [[1,1]];), inf));
	});
	Out.ar(0, MonoGrain.ar(Mix.ar(arr), 0.2, 20)*0.8
	);
}.play
)

(
{
	var orig = SoundIn.ar(0);
	var total = 3;
	MonoGrain.ar(Pan2.ar(Mix.ar(Array.fill(total, {|i| PitchShift.ar(orig, 0.2, 0.9 + (i * 0.1))*(1.0)}))), 0.2, 20);
}.play
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/meri3.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

(
Routine({10.do({|i|
	i.postln;
	1.wait;

})}).play;
Routine({10.do({|i|
	(i+10).postln;
	1.wait;

})}).play

)

/*
(
Routine({
Routine({10.do({|i|
	i.postln;
	1.wait;

})}).play;
Routine({10.do({|i|
	(i+10).postln;
	1.wait;

})}).play
}).play
)
*/