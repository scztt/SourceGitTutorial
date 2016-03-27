(
{
	var sig, width, freq = 80;

	freq = freq + [0, 0.3, 0.65];
	width = LFNoise2.kr([1.3, 1.4, 2.5], 0.5, 0.5);

	// source
	sig = LFPulse.ar(freq, 0, width);
	sig = Mix(sig);

	// some space
	sig = FreeVerb.ar(sig, 0.5, 0.8);

	sig = sig * 0.1;
}.play;
)