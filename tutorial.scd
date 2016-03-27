(
{
	var sig, width, freq = 80;

	width = LFNoise2.kr(2, 0.2, 0.5);    // args are (freq, mul, add), so this is slow, and range is 0.5±0.2

	sig = LFPulse.ar(freq, 0, width);
	sig = Mix(sig);
	sig = sig * 0.1;
}.play;
)