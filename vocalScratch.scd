s.reboot
(
	~one = Buffer.alloc(s,2048,1);
	~two = Buffer.alloc(s,2048,1);
	//~three = Buffer.read(s,"/Applications/SuperCollider/SuperCollider.app/Contents/Resources/sounds/a11wlk01.wav");
~three = Buffer.readChannel(s,"/Users/mikesolomon/Documents/Compositions/madrigali/demoisellesReal/Bounces/marieSnippet.aif",channels:0);
	)

(
	{ var inA, chainA, inB, chainB, chain;
		inA = LFSaw.ar([100, 150], 0, 0.2);
		inB = PlayBuf.ar(1, ~three.bufnum, BufRateScale.kr(~three.bufnum), loop: 1);
		chainA = FFT(~one.bufnum, inA);
		chainB = FFT(~two.bufnum, inB);
		chain = PV_MagMul(chainA, chainB); // writes into bufferA
		0.005 * IFFT(chain).dup;
	}.play(s);
)
	[~one, ~two, ~three].do(_.free);


(
m = Buffer.alloc(s,2048,1);
n = Buffer.alloc(s,2048,1);
)

PV_HainsworthFoote

// LPC for vocoding!!

{LPCAnalyzer.ar(PlayBuf.ar(1, ~three.bufnum, BufRateScale.kr(~three.bufnum), loop: 1),Impulse.ar(440,0,0.2), 256, 50)}.play
{LPCAnalyzer.ar(PlayBuf.ar(1, ~three.bufnum, BufRateScale.kr(~three.bufnum), loop: 1),SinOsc.ar([1,1.1,1.5,1.78,2.45,6.7]*220,0,0.05), 256, 50)}.play
