(
{
	var sig, freq = 80;

	freq = freq + [0, 0.3, 0.65]; // 3 slightly different freqs

	sig = LFPulse.ar(freq, 0, 0.3);
	sig = Mix(sig);
	sig = sig * 0.1;
}.play
)