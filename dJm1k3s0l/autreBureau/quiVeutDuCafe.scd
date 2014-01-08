
(
~quiVeutDuCafeFull = Buffer.read(s, "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/autreBureau/quiVeutDuCafe/quiVeutDuCafeFULL.aif");
~background=Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/pinkertons/sevenStages/2.wav");

	~qvpath = "/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/autreBureau/quiVeutDuCafe/";
	~qvbufs = [
		Buffer.read(s,~qvpath++"caf.aif"),
		Buffer.read(s,~qvpath++"cafe.aif"),
		Buffer.read(s,~qvpath++"du.aif"),
		Buffer.read(s,~qvpath++"e.aif"),
		Buffer.read(s,~qvpath++"fe.aif"),
		Buffer.read(s,~qvpath++"quiVeut.aif"),
		Buffer.read(s,~qvpath++"quiVeutDu.aif")
];
)

(
Routine.new({
	Synth.new("reverb", [\in, 2, \out, 0, \vol, 0.7]);
	Synth.new("speaking", [\bufnum, ~quiVeutDuCafeFull, \pitch, 1.2]);
	Synth.new("boring", [\bufnum, ~background, \vol, 0.4, \ramp, 5]);
	100.do({
		var now = ~qvbufs[(~qvbufs.size - 1).rand];
		now.postln;
		Synth.new("dots", [\out, 2, \bufnum, now, \pitch, 0.8 + 0.4.rand]);
		0.1.wait;
	});
}).play;
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/autreBureau/quiVeutDuCafe/quiVeutDuCafeTest.aif");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}