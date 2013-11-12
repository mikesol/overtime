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
Server.local.options.outDevice_(ServerOptions.devices[3])

(
z = [
	//Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants0.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants1.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants2.aif"),
//Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants3.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants4.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants5.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants6.aif"),
Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/sketches/lesAmants1/amants7.aif"),
]
)

Synth.new(\foobar,[\bufnum, z[8], \vol, 0.5]);

(
a = 0;
q = z.size.rand;
b = {
	var foo;
	if (a !=0, { a.free;} );
	a = Synth.new(\foobar,[\bufnum, q, \vol, 0.5]);
	foo = Array.fill(z.size,{|i|i});
	foo.remove(q);
	q = foo.choose;
};
c = {
	if (a!=0, {a.free;});
	a=0;
}
)


c.value;
b.value;

~weTouch = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/lesAmants/Bounces/lesAmants.aif");
Synth.new(\foobar,[\bufnum, ~weTouch, \vol, 1, \loop, 0]);


(
w = Window.new("GUI Introduction", Rect(200,200,255,100));
x = Button.new(w,Rect(10,0,80,30)).states_([["Touch"],["TOUCH"]]);
y = Button.new(w,Rect(100,0,80,30)).states_([["Touch"],["TOUCH"]]);
x.action = { b.value; };
y.action = { c.value; };
w.front;
)

(
a = IdentityDictionary(know: true);
a.put(\foo, { | x | ("the argument is:" + x).postln });
a.foo;
)
Array.fill(10, {|i| if(i.mod(2) == 0,{[0.2]},{[3.2]}).dup((if(i.mod(2) == 0,{10.rand + 1},{[3.rand + 1]})).rand).flatten }).flatten


Array.fill(7, {[0,0,0,1]}) ++ [[1,1]];


{PlayBuf.ar(2,z[1], BufRateScale.kr(z[1]))}.play
(
SynthDef(\foobar, {arg bufnum=0, vol=0, scale = 1.0, trig=0, startpos=0;

	var snd = PlayBuf.ar(2,bufnum, BufRateScale.kr(bufnum)*scale, trig, startpos, loop: 1);
	Out.ar(0, snd * vol);
}).send(s);
)


(
Routine({
	var kludge = Array.fill(z.size, {|i|i}).scramble;
	var arr = Array.fill(z.size, {|i| Synth.new(\foobar, [\bufnum, z[kludge[i]], \vol, 0, \scale, 1])});
	50.do({|i|
		arr.size.do({ |j|
			if (i.mod(arr.size) == j, {
				arr[j].free;
				arr[j] = Synth.new(\foobar, [\bufnum, z[kludge[j]], \vol, 1, \scale, 1]);
			});
			arr[j].set(\vol, if(i.mod(arr.size) == j, {j.postln; 1}, {0}));
		});
		//(60.0/(160 * 2)).wait;
		(1.0 + 4.0.rand.wait);
		//((2+4.rand)*2*60.0/125.22).wait;
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

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/audit/material6.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.
