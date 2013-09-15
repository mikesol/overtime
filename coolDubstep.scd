{
    var trig, note, son, sweep;

    trig = CoinGate.kr(0.5, Impulse.kr(2));

    note = Demand.kr(trig, 0, Dseq((22,24..44).midicps.scramble, inf));

    sweep = LFSaw.ar(Demand.kr(trig, 0, Drand([1, 2, 2, 3, 4, 5, 6, 8, 16], inf))).exprange(40, 5000);

    son = LFSaw.ar(note * [0.99, 1, 1.01]).sum;
    son = LPF.ar(son, sweep);
    son = Normalizer.ar(son);
    son = son + BPF.ar(son, 2000, 2);

    //////// special flavours:
    // hi manster
    son = Select.ar(TRand.kr(trig: trig) < 0.05, [son, HPF.ar(son, 1000) * 4]);
    // sweep manster
    son = Select.ar(TRand.kr(trig: trig) < 0.05, [son, HPF.ar(son, sweep) * 4]);
    // decimate
    son = Select.ar(TRand.kr(trig: trig) < 0.05, [son, son.round(0.1)]);

    son = (son * 5).tanh;
    son = son + GVerb.ar(son, 10, 0.1, 0.7, mul: 0.3);
    son.dup
}.play

(
{
        var trig, note, son, sweep, bassenv, bd, sd, swr;

	// one impulse per second
     trig = Impulse.kr(1);

	// we have a random note every second. notes will never repeat back to back
        note = Demand.kr(trig, 0, Dxrand([29,28,28,28,28,28,27,25].midicps, inf));

	// we have a random number in the list below, can be back to back
        swr = Demand.kr(trig, 0, Drand([0.5, 1, 2, 3, 4, 6], inf));
	// using the number above, which will be slow, and we have it oscillating exponentially
	// between 40 and 3000
        sweep = LFTri.ar(swr).exprange(40, 3000);

	// add together three really close saw waves using the note. likely creates some sorta beating
        son = LFSaw.ar(note * [0.99, 1, 1.01]).sum;
	// filter low pass with the sweep (remembering this is from 40 to 3000)
        son = LPF.ar(son, sweep);
	// normalizes
        son = Normalizer.ar(son);
	// adds a filtered version with a q of 1500
        son = son + BPF.ar(son, 1500, 2);

        //////// special flavours:
        // hi manster
        son = Select.ar(TRand.kr(trig: trig) < 0.4, [son, HPF.ar(son, 2000) * 4]);
        // sweep manster
        son = Select.ar(TRand.kr(trig: trig) < 0.3, [son, HPF.ar(son,
sweep*1.5) * 4]);
        // decimate
        son = Select.ar(TRand.kr(trig: trig) < 0.2, [son, son.round(0.1)]);

     son = son + GVerb.ar(son, 11, 0.5, 0.7, mul: 0.2);
        son = (son * 2).sin;

     son = son + SinOsc.ar(note,0,LFTri.ar(swr,mul:2,add:1)).tanh;

     bassenv =
Decay.ar(T2A.ar(Demand.kr(Impulse.kr(4),0,Dseq([1,0,0,0,0,0,1,0],inf))),0.7);
     bd = SinOsc.ar(35+(bassenv**4*200),0,7*bassenv).clip2;
     sd = 4*PinkNoise.ar*Decay.ar(Impulse.ar(0.5,0.5),0.4);
     sd = (sd + BPF.ar(4*sd,1000)).clip2;

     ((son*0.5)+bd+sd).tanh;
}.play
) 