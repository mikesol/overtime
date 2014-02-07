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

Buffer.freeAll

(
z = [
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered8.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/powered9.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/scorched7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/shadowed7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned8.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/fast/unsaned9.aif")
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


{PlayBuf.ar(2,z[15], BufRateScale.kr(z[20]))}.play
(
SynthDef(\foobar, {arg bufnum=0, vol=0, scale = 1.0, trig=0, startpos=0;

	var snd = PlayBuf.ar(2,bufnum, BufRateScale.kr(bufnum)*scale, Impulse.kr(trig), startpos, loop: 1);
	Out.ar(0, snd * vol);
}).send(s);
)
Latch
Gate
Impulse

Synth.new(\foobar, [\bufnum, z[1], \vol, 1, \scale, 0.7])
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

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/fastShit4.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.
