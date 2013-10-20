s.reboot;
s.quit;
thisProcess.platform.recordingsDir;
Server.default.makeGui
Server.killAll;
s = Server.local;
s.boot;

ServerOptions.devices[2]
Server.local.options.inDevice_(ServerOptions.devices[3])
Server.local.options.outDevice_(ServerOptions.devices[2])

(
{
	var snd = SoundIn.ar;
	var arr = Array.fill(3, {|i|
		PitchShift.ar(snd, 0.2, SinOsc.kr((i * 0.1) + 0.1, 0, i * 0.1, 0.6 + (i * 0.1)))*0.33}.dup
	);
	Mix.ar(arr);
}.play;
)

play{CombC.ar(PitchShift.ar(SoundIn.ar(0).softclip, 0.2, SinOsc.kr(10,0,0.05,0.7)),1,1/SinOsc.kr(SinOsc.kr(1,0,[0.1,1]),0,30,90),1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider

MonoGrain