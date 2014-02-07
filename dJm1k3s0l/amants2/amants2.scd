s = Server.local
s.boot
/*
(
b = [
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/dollar_slower.wav"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/dollar_slow.wav"),
	Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/dollar_fast.wav"),
]
)

{Pan2.ar(PlayBuf.ar(1,b[0], BufRateScale.kr(b[0])))}.play

{Pan2.ar(PlayBuf.ar(1,b[1], BufRateScale.kr(b[1])))}.play

{Pan2.ar(PlayBuf.ar(1,b[2], BufRateScale.kr(b[2])))}.play

*/

(

SynthDef(\amants2BasicBuf, {|buf, out, start=0|
	Out.ar(out, PlayBuf.ar(1,buf,BufRateScale.kr(buf), startPos: 44100 * start, doneAction: 14));
}).send(s);

SynthDef(\amants2DupBuf, {|buf, out, start=0|
	Out.ar(out, Pan2.ar(PlayBuf.ar(1,buf,BufRateScale.kr(buf), startPos: 44100 * start, doneAction: 2)));
}).send(s);

SynthDef(\amants2Ryan0, {|in, out, kick=0, pan=(-0.2)|
	var snd, p0, p1;
	snd = In.ar(in,1);
	p0 = PitchShift.ar(snd, 0.2, SinOsc.kr(100,0,SinOsc.kr(0.2, 0, 0.1, 0.3), 1.2 + kick));
	p1 = PitchShift.ar(snd, 0.2, SinOsc.kr(0.3,0,0.05,0.8));
	Out.ar(out, Pan2.ar(snd + p0 + p1, pan))
}).send(s);

SynthDef(\amants2Eudes0, {|in, out, pan=0.2|
	var snd, p0, p1;
	snd = In.ar(in,1);
	p0 = PitchShift.ar(snd, 0.2, SinOsc.kr(100,0,0.2,1.0));
	p1 = PitchShift.ar(snd, 0.2, 0.8);
	Out.ar(out, Pan2.ar(snd + p0 + p1, pan))
}).send(s);

SynthDef(\amants2RyanArp, {|in,out,pan=0.2|
	var snd;
	snd = In.ar(in,1);
	snd = Line.kr(0,0.6,8) * PitchShift.ar(snd, 0.2, Demand.kr(Impulse.kr(4),0,Dseq([1.1,1.6,2.1,2.6],inf)));
	Out.ar(out, Pan2.ar(snd, pan));
}).send(s);

SynthDef(\amants2Vocoder, {|in,out|
	var snd;
	snd = LPCAnalyzer.ar(In.ar(in,1),Impulse.ar(Demand.kr(Impulse.kr(0.00001) + Dust.kr(0.5),0,Dseq([440,410,480,510,652],inf)),0,0.2), 256, 50).dup;
	Out.ar(out,snd);
}).send(s);

SynthDef(\amants2Limiter, {|in,out|
	var snd;
	snd = In.ar(in,2);
	Out.ar(out, Limiter.ar(snd));
}).send(s);

SynthDef(\amants2EudesArp, {|in,out,pan=(-0.2)|
	var snd;
	snd = In.ar(in,1);
	snd = Line.kr(0,1,8) * PitchShift.ar(snd, 0.2, Demand.kr(Impulse.kr(4),0,Dseq([0.9,0.8,0.76,0.69,0.6],inf)));
	Out.ar(out, Pan2.ar(snd, pan));
}).send(s);

SynthDef(\amants2Grain, {|in,out,pan=(0.0),mul=1.0|
	var snd;
	snd = In.ar(in,1);
	snd = MonoGrain.ar(snd, SinOsc.kr(20,0,0.005, 0.045), SinOsc.kr(10,0,5,15));
	snd = Array.fill(3, {|i| 0.33 * DelayC.ar(snd, 1.0, Line.kr(0.1, 0.1*(i+1), 10));});
	Out.ar(out,Pan2.ar(Mix.ar(snd),pan)*Line.kr(0,mul,12));
}).send(s);

)


(
~ryanP = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/amants2/Bounces/ryan.aif";
~eudesP = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/amants2/Bounces/eudes.aif";
~beginningP = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/amants2/Bounces/beginning.aif";
~ryan = Buffer.readChannel(s, ~ryanP, channels: 0);
~eudes = Buffer.readChannel(s, ~eudesP, channels: 0);
~beginning = Buffer.readChannel(s, ~beginningP, channels: 0);
~space = Buffer.alloc(s, 44100 * 60.0, 1); // a 60 second 1 channel Buffer
)
(
~ryan.free;
~eudes.free;
~beginning.free;
~space.free
)

~space.free
(
Routine.new({
	var ffwd = 0;
	Synth.new(\amants2DupBuf, [\buf, ~beginning, \out, 0, \start, 0]);
	~beginning.duration.wait;
	~limiter = Synth.new(\amants2Limiter, [\in, 4, \out, 0]);
	~ryan0 = Synth.new(\amants2Ryan0, [\in, 2, \out, 4]);
	//~eudes0 = Synth.new(\amants2Eudes0, [\in, 3, \out, 4]);
	~ryanVo = Synth.new(\amants2Vocoder, [\in, 2, \out, 4]);
	~ryanB = Synth.new(\amants2BasicBuf, [\buf, ~ryan, \out, 2, \start, ffwd]);
	//~eudesB = Synth.new(\amants2BasicBuf, [\buf, ~eudes, \out, 3, \start, ffwd]);
	Routine.new({500.do({
		4.0.rand.wait;
		~ryan0.set(\kick, (0.3.rand - 0.07));
	})}).play;
	(143 - ffwd).wait;
	~grain2 = Synth.new(\amants2Grain,[\in, 2, \out, 0, \mul, 3.0], addAction: \addToTail);
}).play;
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/amants2/justRyan.aif");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}


~grain = Synth.new(\amants2Grain,[\in, 3, \out, 0, \mul, 3.0], addAction: \addToTail);
~grain2 = Synth.new(\amants2Grain,[\in, 2, \out, 0, \mul, 3.0], addAction: \addToTail);
~ryan0.free
~eudes0.free
//~ryanEnd = Synth.new(\amants2RyanArp, [\in, 2, \out, 0], addAction: \addToTail);
//~eudesEnd = Synth.new(\amants2EudesArp, [\in, 2, \out, 0], addAction: \addToTail);
//~bufize.set(\vol, 1)
