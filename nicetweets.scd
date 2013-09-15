o=s.options
o.memSize;
o.memSize = 2.pow(16);
s.quit;
s.boot;
o.memSize;

// really low bassy stuff with light percu
play{Splay.ar(Ringz.ar(Decay2.ar(Impulse.ar([2,3]),0.0001,0.01),Array.geom(9,40,1.75)*LFDNoise3.ar(4,0.1),0.9,0.1))} // #supercollider #sc

// ok perc
play{Ringz.ar(Decay2.ar(TDuty.ar(Dseq([1,1,2,1,1,2,1,4]/10,inf)),0,0.001),Array.geom(12,50,1.1)*LFNoise2.kr(0.5,0.02,1),1,0.01).sum!2}// #sc

// awesome computer freak ooouttt
play{a=LFNoise0;b=FBSineC.ar(a.kr(4,2e4,2e4),a.kr(10,16,17),1,1.005,0.7)!2;Latch.ar(b,Impulse.ar(a.kr(0.5,5e3,4e3)))*a.kr(5,0.4,0.5)}// #sc

// nice dubstep with random swells
play{RLPF.ar(Latch.ar(SinOsc.ar([100,100.5])!2,Impulse.ar(Duty.kr(Dseq([2,1]/4,inf),0,Drand((67,67.2..70),inf)))),800)} // #sc _dubsteppy_

// firecrackers around
play{CombN.ar(Splay.ar(Pulse.ar(Gendy3.kr([1,2,4,6])+LFNoise0.ar(4,6,Gendy3.kr(5,freq:[10,99])))*Gendy2.ar([0,1],maxfreq:[55,99])),3,0.4,2)}

// computery purring
play{x=LFDNoise3;Blip.ar(x.kr(1,[400,100],500),x.kr([1,2],6,5))*Gendy3.ar(1,1,1,1,x.kr(1,99,91),1,0.1)*x.ar(0.5,0.5,0.5)}// #sc

// SuperNintendo race music, detuned synth w/ sines...
play{a=[1,1.01,2,2.02,3.5,4.01,5.501];SinOsc.ar(Duty.kr(0.2,0,Dseq([10,11,0,12.2,0,0,10,0]+39,inf).midicps)*(a++(a*2))).sum!2/2}//DAF #sc

// mine with saw
// LOVE IT!!!
play{a=[1,1.01,2,2.02,3.5,4.01,5.501];Saw.ar(Duty.kr(0.2,0,Dseq([10,11,0,12.2,0,0,10,0]+39,inf).midicps)*(a++(a*2))).sum!2/2}//DAF #sc

// mine with bpf
play{a=[1,1.01,2,2.02,3.5,4.01,5.501,6.02,7.503,8.05,10.5];BPF.ar(WhiteNoise.ar, Duty.kr(0.2,0,Dseq([10,11,0,12.2,0,0,10,0]+39,inf).midicps)*(a++(a*2)), 0.005, [2,1.9,1.8,1.8,1.7,1.6,0.65,0.5,0.4,0.3,0.2]).sum!2/2}//DAF #sc

// SuperNintendo race music
play{SinOsc.ar(Duty.kr(0.2,0,Dseq([0,5,0,15,0,12,0,0,12,0,12,0,12,10,0,12]+47,inf).midicps)*[1,1.01,2,2.02,3.5,4.01,5.501]).sum!2}// DAF #sc

// samples so fast that it's creaky
b=Buffer.read(s,"/Applications/SuperCollider/SuperCollider.app/Contents/Resources/sounds/a11wlk01.wav".pathMatch@0);play{x=SinOsc;ring4(ar(TGrains,2,kr(Impulse,ar(x,[1,3],0,10,[9,20])),b,1,ar(x,1/9),0.01),ar(x,1e3))*9}

// cool glitchy parsing audio file
b=Buffer.read(s,"/Applications/SuperCollider/SuperCollider.app/Contents/Resources/sounds/a11wlk01.wav".pathMatch[0]);play{TGrains.ar(2,Impulse.kr([9,19]*LFNoise0.kr(2,1,1)),b,LFNoise0.kr(1,(1..4),2),0,1/10).sum*10}//#sc

// very violent NO HEADPHONES
play{SinOsc.ar(Latch.ar(SinOsc.ar(1.75,0,1e2,2e2),Impulse.ar((1,1.1..2)*2)).lag(0.1)/2*(1,1.25..8)).sum**3!2}// #supercollider (last one)

// very violent NO HEADPHONES
play{ SinOsc.ar(Latch.ar(SinOsc.ar(1.75,0,1e2,2e2),Impulse.ar([1,1.0001])).lag(0.1)*(1,1.25..8)).sum**3!2 } // #supercollider

// fire burning
play{x=LFNoise2.kr(22,5,9);CombC.ar(Splay.ar(Gendy3.ar([4,2],[0.5,1],[1/9,1/4]*x,[1/2,1/8]*x,(9,49..199))),5,[0.13,0.1],[x/2,x/2.1])} // #sc

// computery
{x=TRand.kr(30,XLine.kr(2e4,30,99,1,1,2),Impulse.kr((1..9))).cpsmidi.round.midicps;Splay.ar(SinOsc.ar(x))*AmpComp.kr(x,10)}.play // #sc

// clippy noise beatsshhh
play{t=TDuty.kr(Dseq([1,1,4,2,2]/8,inf));Resonz.ar(Crackle.ar!2,Demand.kr(t,0,Dseq([250,8e3],inf)),Demand.kr(t,0,Dwhite(0.01,0.5,inf)))}

// nice noise beat
play{t=TDuty.kr(Dseq([1,1,4,2,2]/8,inf));Resonz.ar(WhiteNoise.ar!2,Demand.kr(t,0,Dseq([250,8e3],inf)),Demand.kr(t,0,Dwhite(0.01,0.5,inf)))}

// R2D2 ish ?
play{t=Impulse.ar((1,1.3..4)/2).sum;Decay2.ar(t,0.05,0.2,Splay.ar(SinOsc.ar(Demand.ar(t,0,Drand((120,180..800),inf)))*ToggleFF.ar(t)))}

// clipped perky
play{t=Impulse.ar((1,1.3..4)/2).sum;Decay2.ar(t,0.001,0.2,Splay.ar(SinOsc.ar(Demand.ar(t,0,Drand((120,145..400),inf)))*ToggleFF.ar(t)+t))}

// cool resonater
play{BPF.ar(SoundIn.ar(0),Array.geom(16,120,1.5),0.005,1).sum.dup} // kind of EZ resonator / vocoder for the mic #supercollider

// mine
play{BPF.ar(SoundIn.ar(0),SinOsc.kr(1,0,10,Array.geom(16,120,1.5)),0.005,1).sum.dup} // kind of EZ resonator / vocoder for the mic #supercollider


// mine
play{BPF.ar(SoundIn.ar(0),SinOsc.kr(1,0,Array.geom(16,10,1.5),Array.geom(16,120,1.5)),0.005,1).sum.dup} // kind of EZ resonator / vocoder for the mic #supercollider


// mine
play{BPF.ar(SoundIn.ar(0),SinOsc.kr(SinOsc.kr(1,0,4,5),0,Array.geom(16,10,1.5),Array.geom(16,120,1.5)),0.005,1).sum.dup} // kind of EZ resonator / vocoder for the mic #supercollider

// cool vocoder effect!!!
play{FreeVerb.ar(CombC.ar(SoundIn.ar(0).softclip,1,1/120,1),0.4,1,1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider


// funny irish?
play{SinOsc.ar(Latch.ar(SinOsc.kr(0.75).range(0,12).round.midiratio*[200,400*SinOsc.kr(0.01).range(1,4)],TDuty.kr(Dseq([1,2]/8,inf))))} //ye


// cool bassy percussion
play{GVerb.ar(Decay2.ar(TDuty.ar(Dwrand([2,4,8,16]/16,[7,1,1,1]/10,inf)),0.02,0.05,SinOsc.ar(LFDNoise3.kr(40,199,150))).tanh,1,0.5)} // #sc

// two following are interesting churchy
play{d=Duty;f=d.kr(1/[1,2,4],0,Dseq([0,3,7,12,17]+24,inf));GVerb.ar(Blip.ar(f.midicps*[1,4,8],LFNoise1.kr(1/4,3,4)).sum,200,8)}

play{d=Duty;f=d.kr(1/[1,2,3],0,Dseq([0,3,7,12,8]+36,inf));GVerb.ar(Blip.ar(f.midicps*[1,2,3],LFNoise1.kr(1,8,8)).sum,99,4)}

// tame, happy minor
9.do{|i|Pbind(\scale,#[0,3,5,7,10],\octave,3.rand+3,\dur,(12.rand+1)/5,\degree,Pn(Plazy{Pseq(18.partition(8.rand+2)-1,4)})).play}

// cool techno bassy
play{t=Impulse.kr(6);f=lag(Demand.kr(t,0,Drand(midicps((10,13..40)),inf)));RLPF.ar(Pulse.ar(f),1+Decay2.kr(t)*LFNoise2.kr(2,8,9)*f,1/9)!2}

// interesting winding up - disturbing - can likely complexify sound
l=Line;fork{loop{play{Splay.ar(SinOsc.ar({x=rrand(1,7)*99;l.kr(x,x/(0.25,0.5..4).choose,9)}!9,0,1/9)*l.ar(1,0,9,0.5,0.5,2))};1.wait}}// #sc

// hard - computery
play{a={rrand(-1,1.0)}!1e3;e=InterplEnv(a,[1e-3],a*3);IEnvGen.ar(e,LFSaw.kr(LFCub.kr(8,0,300,300),0,e.times.sum)*LFNoise2.kr(99,1,10))!2}


// rhythmed chaotic noise
play{Splay.ar(Logistic.ar(LFCub.kr([1,2,4,8],0,1.9,2),LFNoise0.kr(1/[16,12,8,4],400,999).round(150)))}// #supercollider #sc <3 chaotic noise

// like getting a nintendo thingee
play{Splay.ar(Logistic.ar(LFPar.kr([1,2,4,8,16]/8,0,1.9,2),LFNoise0.kr(1/[2,4,8,16],3000,4000).round(50)))} // #sc #supercollider 8-bit sfx

// squarewavy - alternatens between soft and loud
play{Splay.ar(Logistic.ar(LFCub.kr([1,2,4,6],0,1.5,2),LFNoise0.kr(1/[2,2,4,4],250,300).round(50))).lag(LFCub.kr(1/8,0.001,0.003))}

// mystical, slow, alien
fork{loop{r=rrand(-9,9);9.do{play{Pan2.ar(SinOsc.ar(LinRand(40,900,r))*EnvGen.ar(Env.sine(9),1,0.1,0,1,2),rrand(-1,1.0))}};rrand(6,8).wait}}

// drop music
play{l=LocalIn.ar+Decay2.ar(Impulse.ar(3),3e-2,0.05,LFCub.ar(LFNoise2.kr(19,500,600)));l=DelayN.ar(l,1,1/2);LocalOut.ar(l/3);l!2}

// annoying lf saw
play{l=LFSaw;l.ar(l.kr(l.kr([1,3],0,4,[5,6]),l.kr(1/[4,8]),l.kr(1,0,99,100),l.kr(1/2,0,50,l.kr(1/4,1/3,50,100))))/2} // #sc LFSaw galore

// low lf dubstep with sweeps
play{l=LFTri;l.ar(l.kr(1/4,1/1.5,l.kr(1,0,10,10),{|i|50+i}!8+l.kr(1/3,0,3,40)),0,l.kr((1..8),0,0.2).excess(0.01)*({|i|16-i/20}!16)).sum!2}

// scifi beating
play{l=LFCub;Splay.ar(l.ar(l.kr(9.1,0,100,(200,300..500)),0,(l.kr(9,0,1,l.kr(1/[2,3,5,7],0,0.5,0))>(l.kr(1/2,0,0.4,0.5))).lag/2))} // #sc

// nice lurching...sighing...sound world not interesting...
play{Splay.ar(LFCub.ar(LFTri.kr([1,1.1],0,LFPar.kr(1/7,0,10),{(100,150..500).choose}!5),0,LFSaw.kr(4/[1,3,4,6,8])**LFPar.kr(1/8,0,9,16)))}


// sorta siren...really fucked up!
play{o=LFCub.kr(1/[24,7,13,18]);PitchShift.ar(LFPulse.ar(o[0]*50+100,0,0.1).lag(1/1000),o[3]*0.299+0.3,o[2]*8+8,o[1],o[0]*0.1+0.1)!2} // #sc

// awesome glitch rise
play{l=LFSaw;Clip.ar((LFTri.ar(l.kr(1/[8,9],0,25,25).round(1),0,50,50).poll&l.kr(1/[7,5],0,25,25)).poll,-1,1)} // #sc glitchy 8-bity

// fun glitchy stuff
play{l=LFPar;Clip.ar((LFCub.ar(l.kr(1/[8,9],0,25,25).round(1),0,50,50) & l.kr(1/[7,5],0,25,25)),-1,1)}


// SC140

//01
//Nathaniel Virgo
// in a cave with grumbling in background
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a}.play//#supercollider

//02
//LFSaw
// swingin...
{Splay.ar(Ringz.ar(Impulse.ar([2, 1, 4], [0.1, 0.11, 0.12]), [0.1, 0.1, 0.5])) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2)}.play

//03
//Tim Walters
// nice clipping with flairs that escape
play{({|k|({|i|y=SinOsc;y.ar(i*k*k,y.ar(i*k**i/[4,5])*Decay.kr(Dust.kr(1/4**i),y.ar(0.1)+1*k+i,k*999))}!8).product}!16).sum}//#supercollider

//04
//Nathaniel Virgo
// creates fun screwed up house
b=Buffer.read(s,"/Users/mikesolomon/Documents/Compositions/overtime/tests/house0.aif");play{t=Impulse.kr(5);PlayBuf.ar(1,b,1,t,Demand.kr(t,0,Dseq(1e3*[103,41,162,15,141,52,124,190],4)))!2}

//05
//Batuhan Bozkurt
// fun single noise flapping - maybe change noise over time, rock rolling background cool!
play{f=LocalIn.ar(2).tanh;k=Latch.kr(f[0].abs,Impulse.kr(1/4));LocalOut.ar(f+CombC.ar(Blip.ar([4,6],100*k+50,0.9),1,k*0.3,50*f));f}//44.1kHz

//07
//Thor Magnusson
// thumpin
play{x=SinOsc;y=LFNoise0;a=y.ar(8);(x.ar(Pulse.ar(1)*24)+x.ar(90+(a*90))+MoogFF.ar(Saw.ar(y.ar(4,333,666)),a*XLine.ar(1,39,99,99,0,2)))!2/3}

//09
//MCLD
// fun electronica with clips
{LocalOut.ar(a=DynKlank.ar(`[LocalIn.ar.clip2(LFPulse.kr([1,2,1/8]).sum/2)**100*100],Impulse.ar(10)));HPF.ar(a).clip2}.play

//10
//Julian Rohrhuber
// good background, flangy
/*eclecticity*/ Ndef(\x, { SinOsc.ar(BrownNoise.ar(30!2, 200), Ndef(\x).ar * LFNoise1.kr(1!2,1,1)) }).play;

//11
//Micromoog
// 80s fun
play{VarSaw.ar((Hasher.ar(Latch.ar(SinOsc.ar((1..4)!2),Impulse.ar([5/2,5])))*300+300).round(60),0,LFNoise2.ar(2,1/3,1/2))/5}//#supercollider

//12
//Jose Padovani
// shake that bizassse
play{x=165;b=SinOsc;p=Trig.ar(Saw.ar(x),1);y=b.ar(p*x);z=b.ar(p);(GVerb.ar(GrainIn.ar(2,y,y/2,z,p*z,-1),9))/9}//basso gettato #SuperCollider

//13
//Batuhan Bozkurt
// 80s with clips
play{LeakDC.ar(BRF.ar(Saw.ar(8,Decay2.kr(x=Duty.kr(1/8,0,Drand([0,Drand((0.4,0.5..1))],inf)),0.01,0.3))**1.5,x*20+[45.1,45],0.1)).tanh}//#sc

//14
//Nathaniel Virgo
// big space w/ bpf
Ndef('x',{x=Ndef('x').ar+0.01;a=BPF.ar(x,6**Latch.ar(x,Dust.ar(x))*200,0.1).sin;9.do{a=AllpassN.ar(a,0.2,{0.2.rand}!2,9)};a+a.mean}).play;

//15
//Jason Dixon
// nice annoying high electric buzz
{x=Array.fill(5,{[0.00001,0.03].asSpec.map(LFNoise2.kr(3))});Splay.ar(Friction.ar(LFTri.ar(50),friction:x,mass:x*30000))}.play

//16
//Batuhan Bozkurt
// clippy synth cutting
play{AllpassC.ar(SinOsc.ar(55).tanh,0.4,TExpRand.ar(2e-4, 0.4,Impulse.ar(8)).round([2e-3,4e-3]),2)};// #supercollider with bass please...

//17
//redFrik
// freaking out synth!!!
{RHPF.ar(GbmanN.ar([2300,1150]),LFSaw.ar(Pulse.ar(4,[1,2]/8,1,LFPulse.ar(1/8)/5+1))+2)}.play //punk (loud!)

//22
//MCLD
// nice flangy computer freakoutitude
play{a=Duty.kr(0.1,0,Dseq(fib(32).wrap(20,55).midicps,inf));HPF.ar(LeakDC.ar(Splay.ar(LFCub.ar([-1,a,a/3,-2])))*9).clip2/9};//#supercollider

