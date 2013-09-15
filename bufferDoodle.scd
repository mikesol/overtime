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
~house = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/house0.aif");
)

{PlayBuf.ar(2, ~house)}.play;

///////////// Figure 1.8 Playback buffers


(  // phasing
{
	var rate, trigger, frames;
	frames = ~house.numFrames;

	rate = [1, 1.01];
	trigger = Impulse.kr(rate); // sends it to different places
	PlayBuf.ar(2, ~house, 1, trigger, frames * Line.kr(0, 1, 60)) *
	EnvGen.kr(Env.linen(0.01, 0.96, 0.01), trigger) * rate;
}.play;
)

/////////////

(  // speed and direction change
{
	var speed, direction;
	speed = LFNoise0.kr(12) * 0.2 + 1; // hovering between 0.8 and 1.2
	direction = LFClipNoise.kr(1/3); // 1 or -1
	PlayBuf.ar(2, ~house, (speed * direction), loop: 1);
}.play;
)

///////////// Figure 1.9 Connecting controls with a bus

// more or less same as above...

(
// if these haven't been used they will hold 0
~kbus1 = Bus.control; // a control bus
~kbus2 = Bus.control; // a control bus
{
	var speed, direction;
	speed = In.kr(~kbus1, 1) * 0.2 + 1;
	direction = In.kr(~kbus2);
	PlayBuf.ar(2, ~house, (speed * direction), loop: 1);
}.play;
)

(
// Start the controls
{Out.kr(~kbus1, LFNoise0.kr(12))}.play;

{Out.kr(~kbus2, LFClipNoise.kr(1/4))}.play;
)



///////////// Figure 1.10 Buffer modulation

(
{
	Out.ar(0,
		Pan2.ar( PlayBuf.ar(2, ~house, loop: 1) *
			SinOsc.ar(LFNoise0.kr(12, mul: 500, add: 600)),
		0.5)
	)
}.play
)

// all pass comb filter, create delay

(
{
var source, delay;
	source = PlayBuf.ar(2, ~house, loop: 1);
	delay =  AllpassC.ar(source, 2, [0.65, 1.15], 10);
	Out.ar(0,
	Pan2.ar(source) + delay
	)
}.play
)

(
// zig zag around sound
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    var rate;
    rate = LFNoise2.kr(XLine.kr(1, 20, 60), 2);
    Out.ar(out,
        PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * rate, 1, 0, 1)
    )
}).play(s, [\out, 0, \bufnum, ~house]);
)

{Vocoder.ar(Mix.new( Array.fill(8, {arg x; SinOsc.ar(Saw.kr(3,0,100,300) + (x * 205) /*+ LFNoise1.ar(100, 40, 100)*/, 0, 0.3) }) ),PlayBuf.ar(2, ~house, BufRateScale.kr(~house), 1, 0, 1),56)}.play;

(
// using my voice
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
	var in, amp, pitch, rate;
	in = AudioIn.ar(1);
	amp =  Amplitude.ar(in);
	pitch = Pitch.kr(in, 100, 40, 800);
	rate = Lag2.ar(1 + (((pitch - 440)/110)*amp), 0.2);
	rate.poll(Impulse.ar(20), "value");
	Out.ar(out,
		PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * rate, 1, 0, 1)
	)
}).play(s, [\out, 0, \bufnum, ~house]);
)