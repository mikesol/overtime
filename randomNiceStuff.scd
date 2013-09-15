(
SynthDef("conformer2", {
    var in, chain, out;
    in = Mix.ar(LFSaw.ar(SinOsc.kr(Array.rand(3,0.1,0.5),0,10,[1,1.1,1.5,1.78,2.45,6.7]*220),0,0.3));
    chain = FFT(LocalBuf(2048), in);
    chain=PV_ConformalMap(chain, MouseX.kr(0.01,2.0, 'exponential'), MouseY.kr(0.01,10.0, 'exponential'));
    out=IFFT(chain);
	//Out.ar(0,in);
    Out.ar(0, Pan2.ar(CombN.ar(out, 0.1, 0.1, 10, 0.5, out), 0, 0.3));
}).play(s);
)

// cool lf saw

play{Pan2.ar(Mix.ar(LFSaw.ar(SinOsc.kr(Array.rand(3,0.1,0.5),0,10,[1,1.1,1.5,1.78,2.45,6.7]*220),0,0.3)),SinOsc.kr(0.3,0,0.3))};

