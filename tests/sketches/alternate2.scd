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
z = IdentityDictionary.newFrom([\fast, [
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
],
	\slow, [Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/shadowed7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned2.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned7.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned8.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/shitloads/slow/unsaned9.aif")
]])
)

Array.fill(10, {|i| if(i.mod(2) == 0,{[0.2]},{[3.2]}).dup((if(i.mod(2) == 0,{10.rand + 1},{[3.rand + 1]})).rand).flatten }).flatten

(
SynthDef(\foobar, {arg bufnum=0, vol=0, trig=0, startpos=0;

	var snd = PlayBuf.ar(2,bufnum, BufRateScale.kr(bufnum), trig, startpos);
	Out.ar(0, snd * vol);
}).send(s);
)

a = Synth.new(\foobar, [\bufnum, z.at(\fast)[10], \vol, 1]);

a.set(\startpos, 44100)

\foo === \foo

(
Routine({
	var tempos = IdentityDictionary.newFrom([\fast, 160, \slow, 70]);
	var kludge = IdentityDictionary.newFrom([\fast, Array.fill(z.at(\fast).size, {|i|i}).scramble, \slow, Array.fill(z.at(\slow).size, {|i|i}).scramble]);
	var dict = IdentityDictionary.newFrom([\fast, Array.fill(z.at(\fast).size, {|i| Synth.new(\foobar, [\bufnum, z.at(\fast)[kludge.at(\fast)[i]], \vol, 0])}).scramble, \slow, Array.fill(z.at(\slow).size, {|i| Synth.new(\foobar, [\bufnum, z.at(\slow)[kludge.at(\slow)[i]], \vol, 0])}).scramble]);
var fastslow = [\fast, \slow];
var current = 0;
var clocktime = 0.0;
var platz = 0;
"OK SO FAR".postln;
	10000.do({|i|
	var towait = (10.rand * 0.1);
	fastslow.do({|fs, k|
		dict.at(fs).size.do({ |j|
			dict.at(fs)[j].set(\vol, if( (i.mod(dict.at(fs).size) == j) && (fs === fastslow[current.mod(2)]), {fastslow[current.mod(2)].post; " ".post; j.postln; 1}, {0}));
			//arr[j].set(\startpos, (44100*4).rand);
		});
		});
		towait.wait;
	clocktime = clocktime + towait;
		platz = platz + (towait * tempos.at(fastslow[current.mod(2)])) / 60.0;
	if (1.0.rand < 0.1, { current = current + 1;

		fastslow.do({|fs, k|
		dict.at(fs).size.do({ |j|
					dict.at(fs)[j].set(\startpos, platz * (1.0 / tempos.at(fs)) * 60 * 44100);
		});
		});

					fastslow.do({|fs, k|
		dict.at(fs).size.do({ |j|
					dict.at(fs)[j].set(\trig, 1);
		});
		});

					fastslow.do({|fs, k|
		dict.at(fs).size.do({ |j|
					dict.at(fs)[j].set(\trig, 0);
		});
		});

		});
	});
}).play;
)
Gate

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
