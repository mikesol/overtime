(
Routine.new({
	var hello = [];
	var limiter;
	var offset = 113;

	thisThread.randSeed = 0;
	limiter = Synth.new(\limiter);
	Routine.new({500.do({|i| i.postln; 1.wait;})}).play;
	~basicstuff.(0, \boring, [\out, 1], offset + 0);
	~basicstuff.(32, \tame, [\out, 1], offset + 15);
	~basicstuff.(48, \lesstame, [\out, 1], offset + 14); // probably better than foo here...
	//~basicstuff.(64, \lynch, [\grrr, 2, \out, 1], offset + 16);
	//~basicstuff.(72, \lynch, [\grrr, 4, \out, 1], offset + 12);
	~basicstuff.(64, \lynch, [\grrr, 4, \out, 1], offset + 12);
	~basicstuff.(76, \foo, [\out, 1], offset + 10);
	~basicstuff.(81, \lynch, [\grrr, 16, \out, 1], offset + 4);
	//~basicstuff.(83, \lynch, [\grrr, 0.5, \out, 1], offset + 16);
	//~basicstuff.(84, \lynch, [\grrr, 0.5, \out, 1], offset + 6);
	Routine.new({(offset - 23).wait; Synth.new(\oneNote, [\out, 1, \vol, 0.25, \buf, ~luLow, \rate, 0.25]);}).play;

	// and...

	~chords.(58);

	// and...

	~down.(offset+7);

}).play;
)