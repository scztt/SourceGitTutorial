(
{
	var sig, width, freq = 80;

	freq = freq + [0, 0.3, 0.65];
	width = LFNoise2.kr([1.3, 1.4, 2.5], 0.5, 0.5); // 3 LFNoise2's

	sig = LFPulse.ar(freq, 0, width); // 3 LFPulse's
	sig = Mix(sig);

	sig = sig * 0.1;
}.play;
)