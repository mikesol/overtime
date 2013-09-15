MIDIClient.init;
MIDIClient.destinations;

~midi = MIDIOut(0);

~midi.noteOff(0,64);


(
var r;
r = Routine {
	10.do({ arg i;
		    10.do({ arg a;
			var v;
			v = 40+48.rand;
			        //~midi.noteOn(0,if((i%2==0),{a+60},{70-a}));
			~midi.noteOn(0,v);
			        (100.rand*0.001).wait;
			~midi.noteOff(0,v);
		    });
	});
    // Wait half second before saying we're done
    0.5.wait;
    "done".postln;
}.play;
)