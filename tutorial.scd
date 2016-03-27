(
{
	var sig, noise, width, freq = 80;

	freq = freq + [0, 0.3, 0.65];
	width = LFNoise2.kr([1.3, 1.4, 2.5], 0.5, 0.5);

	// Source
	sig = LFPulse.ar(freq, 0, width);
	noise = sig * WhiteNoise.ar(0.2); // Make WhiteNoise quiet - just want a little more noise
	sig = sig + noise; // I want mostly the original, so add the noise to the original sig
	sig = Mix(sig);

	// space
	sig = CombC.ar(sig, 1, 1, -12);

	sig = sig * 0.1;
}.play;
)