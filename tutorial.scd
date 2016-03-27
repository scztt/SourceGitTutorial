(
{
	var sig;
	sig = SinOsc.ar([100, 200, 300]).postln;
	sig = Mix(sig * 0.1).postln;  // Multiple by 0.1 because it's 3 signals, so it's louder now
}.play;)