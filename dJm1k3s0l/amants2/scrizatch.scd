SynthDef(\amants2Buffy, {|wrtbuf, in, out|
    var money, play, line, pan, env, freqdev, grainlen, impulz;

	grainlen = LFNoise1.kr(10).range(0.05,0.1);//0.1;
	impulz = LFNoise1.kr(10).range(8,15);//10
	money = 1;//BufDur.kr(inbuf)/BufDur.kr(wrtbuf);
	line = 1;//Line.kr(0,1*money,BufDur.kr(inbuf));
	play = In.ar(in,1);//PlayBuf.ar(2,inbuf,1, doneAction: 2);
	//Poll.kr(Impulse.kr(1),play);
	RecordBuf.ar(play, wrtbuf, loop: 0);
	pan = SinOsc.kr(Demand.kr(Impulse.kr(1),0,Drand([0.1,1,5],inf)));//MouseX.kr(-1, 1);
	// multiplies by the line to avoid writing problems...will suck in beginning...
	Out.ar(out, Line.kr(0,1,10) *
		GrainBuf.ar(2, Impulse.kr(impulz), grainlen, wrtbuf, LFNoise1.kr.range(0.5, 2), Saw.kr(1.0/80,20,20), 2, pan))
}).send(s);