(
{
	var in, amount, amCoef;
	in = HPF.ar(SoundIn.ar(0), 400)*5;
	amount = 0.99;
	amCoef= 2*amount/(1-amount);
	MidEQ.ar(LPF.ar((1+amCoef)*in/(1+(amCoef*in.abs)), [3800, 3900])*0.5, 120, 0.7, 8);
}.play;
)


{PitchShift.ar(PlayBuf.ar(2,d,1,1,100*44100), 0.2, Line.ar(1,0,10))}.play
{PlayBuf.ar(2,d,BufRateScale.kr(d)*Line.ar(1,0,10),1,100*44100)}.play

c = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/crapLyon.aiff");
d = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/crap4distorted.aiff");

(
{
	var in, amount, amCoef;
	in = HPF.ar(PlayBuf.ar(2,c,BufRateScale.kr(c)), 0)*5;
	amount = (Line.ar(0,1,100)**1)*0.99;
	amCoef= 2*amount/(1-amount);
	MidEQ.ar(LPF.ar((1+amCoef)*in/(1+(amCoef*in.abs)), [3800, 3900])*0.5, 120, 0.7, 8);
}.play;
)

s.prepareForRecord("/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/crapMixed.aiff");
s.record;
s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

(
{
	var in, amount, amCoef;
	in = HPF.ar(PlayBuf.ar(2,c,BufRateScale.kr(c)), 0);
	amount = 0;
	amCoef= 2*amount/(1-amount);
	MidEQ.ar(LPF.ar((1+amCoef)*in/(1+(amCoef*in.abs)), [3800, 3900])*0.5, 120, 0.7, 8);
}.play;
)

(
SynthDef("Distortion_FX", {|buf,outputChannels=0,inputChannels=4,drive=0.3,type=0,outAmp=1|
   var out;
	out = PlayBuf.ar(2,buf,BufRateScale.kr(buf))*(((drive**2)+0.02)*50);
   out= SelectX.ar(type,[out.softclip,out.distort,out.clip(-1,1),out.fold(-1,1)]);
   out = out * ((outAmp**2)*(1-(drive/2.6)));
   Out.ar(outputChannels,out);
}).play(s, [\buf, c, \drive, 0.6, \type, 3]);
)

{Clipper8.ar(PlayBuf.ar(2,c,1))}.play


q = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/crapLyon.aiff");
r = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/crap4distorteddownfaster.aiff");
t.free;
t = Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/dJm1k3s0l/bruit/crapLyonIntro.aiff");


(
Routine.new({
{
	PlayBuf.ar(2,t,BufRateScale.kr(t), doneAction: 2);
}.play;
	14.4.wait;
	{
	Limiter.ar(
		PlayBuf.ar(2,q,BufRateScale.kr(q))
		+ PlayBuf.ar(2,r,BufRateScale.kr(r), doneAction: 2));
}.play;}).play;
)
