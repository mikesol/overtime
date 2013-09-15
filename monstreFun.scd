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
b = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/madrigali/j-sho/Bounces/eudes0.aif");
c = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/madrigali/j-sho/Bounces/eudes1.aif");
d = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/madrigali/j-sho/Bounces/eudes2.aif");
e = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/madrigali/j-sho/Bounces/eudes3.aif");
f = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/madrigali/j-sho/Bounces/eudes4.aif");
)

(
SynthDef(\eudesBuf, {
	var play;

	play = PitchShift.ar(PlayBuf.ar(2,Demand.kr(MouseY.kr() > 0.5, 0, Drand([b,c,d,e,f], inf)),1,MouseY.kr() > 0.5), 0.2, 0.8);
	Out.ar(0, play);
}).play;
)
play{PlayBuf.ar(2,b,1,t,Demand.kr(t,0,Dseq(1e3*[103,41,162,15,141,52,124,190],inf)))!2}

play{t=Impulse.kr(14.0/3.0);PlayBuf.ar(2,b,1,t,Demand.kr(t,0,Dseq(1e3*Array.fill(8,{15+400.rand}),inf)))!2}

play{t=Impulse.kr(14.0/3.0);PlayBuf.ar(2,b,1,t,Demand.kr(t,0,Dseq(1e3*Array.fill(8,{(Array.fill(8,{15+400.rand})!4).flatten}).flatten,inf)))!2}

play{PlayBuf.ar(2,~psb,1,doneAction: 2)};

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/voiceEffectSketches/marieTest.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/voiceEffectSketches/eudesTest.wav");
s.record;
s.stopRecording;