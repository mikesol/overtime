
(
~jenAiDejaFull = Buffer.read(s, "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/autreBureau/jenAiDeja/jenAiDejaFULL.aif");
~background=Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/pinkertons/sevenStages/4.wav");

	~japath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/autreBureau/jenAiDeja/";
	~jabufs = [
		Buffer.read(s,~japath++"ai.aif"),
		Buffer.read(s,~japath++"ci.aif"),
		Buffer.read(s,~japath++"dej.aif"),
		Buffer.read(s,~japath++"ja.aif"),
		Buffer.read(s,~japath++"jen.aif"),
		Buffer.read(s,~japath++"merc.aif"),
		Buffer.read(s,~japath++"merci.aif")
];
)

(
Routine.new({
	Synth.new("reverb", [\in, 2, \out, 0, \vol, 0.7]);
	Synth.new("speakingSimpler", [\bufnum, ~jenAiDejaFull, \pitch, 0.5, \mul, 0.7]);
	Synth.new("boring", [\bufnum, ~background, \vol, 0.4, \ramp, 5]);
	100.do({
		var now = ~jabufs[(~jabufs.size - 1).rand];
		now.postln;
		Synth.new("dots", [\out, 2, \bufnum, now, \pitch, 0.8 + 0.4.rand]);
		0.1.wait;
	});
}).play;
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/autreBureau/jenAiDeja/jenAiDejaTest.aif");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}