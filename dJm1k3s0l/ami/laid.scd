s = Server.local;
s.boot;

~drumz = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/ami/amiLaid.aif");
~fly = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/ami/fly.aif");
~bowl = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/ami/singingbowl.wav");


(
SynthDef.new(\drumzDistort,{|buf|
	var snd, snd2, snd3, outsound;
	snd = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * 1.1, doneAction: 2);
	snd2 = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * 1.12, doneAction: 2);
	snd3 = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * 2, doneAction: 2);
	snd = LPF.ar(snd, 400);
	snd2 = HPF.ar(snd2, 5000);
	snd3 = HPF.ar(snd3, 10000);
	outsound = snd + snd2 + snd3;
	outsound = FreeVerb2.ar(outsound[0], outsound[1], 0.5, 0.7, 0.5);
	Out.ar(0, Limiter.ar(outsound));
}).send(s);

SynthDef.new(\fly,{|buf|
	var snd;
	//snd = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * SinOsc.kr(0.2,0,0.03,1), doneAction: 2);
	snd = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * SinOsc.kr(0.1,0,0.2,0.8), doneAction: 2);
	snd = PitchShift.ar(snd, 0.2, 0.25);
	snd = FreqShift.ar(snd, 100);
	snd = FreeVerb2.ar(snd[0], snd[1], 0.9, 0.9, 0.9);
	Out.ar(0, Limiter.ar(snd));
}).send(s);

SynthDef.new(\bowl,{|buf, s, e|
	var snd;
	//snd = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * SinOsc.kr(0.2,0,0.03,1), doneAction: 2);
	snd = PlayBuf.ar(2,buf,BufRateScale.kr(buf) * Line.kr(s,e,BufDur.kr(buf)), doneAction: 2);
	Out.ar(0, Limiter.ar(snd));
}).send(s);
)

Synth.new(\drumzDistort, [\buf, ~drumz]);

Synth.new(\fly, [\buf, ~fly]);

//Synth.new(\bowl, [\buf, ~bowl, \s, 2.0, \e, 1.9]); // 1
Synth.new(\bowl, [\buf, ~bowl, \s, 1.9, \e, 1.8]); // 2


s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/ami/highcling2.wav");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.}