(

SynthDef(\leLicenciementMike, {
	var in = SoundIn.ar;
	Out.ar(0, PitchShift.ar(in, 0.2, 0.75), PitchShift.ar(in, 0.2, 1.5));
}).store;

SynthDef(\overtimeMike, {|thresh|
	var in, amp, trig;
	in = SoundIn.ar;
	amp = Amplitude.kr(in);
	trig = Lag.kr(amp - thresh, 0.1);
	//Poll.kr(Impulse.kr(20), trig, "myamp");
	SendReply.kr(trig, '/hello');
}).store;

SynthDef(\overtimeMike2, {|lagU=1.0, lagD=2.0, exp=1.0|
	var in, amp;
	in = SoundIn.ar;
	amp = Amplitude.kr(in);
	amp = LagUD.kr(amp**exp, lagU, lagD);
	SendReply.kr(Impulse.kr(10), '/hello', values: amp);
}).store;

SynthDef(\overtimeMike2Test, {|lagU=1.0, lagD=2.0, exp=1.0|
	var amp;
	amp = MouseX.kr;
	amp = LagUD.kr(amp**exp, lagU, lagD);
	SendReply.kr(Impulse.kr(10), '/hello', values: amp);
}).store;


)