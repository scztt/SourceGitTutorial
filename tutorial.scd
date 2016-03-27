(
{
	var sig, noise, width, freq = 280, filterFreq;

	freq = freq + [0, 0.3, 0.65];
	width = LFNoise2.kr([1.3, 1.4, 2.5], 0.5, 0.5);

	// source
	sig = LFPulse.ar(freq, 0, width);
	noise = sig * WhiteNoise.ar(0.1);
	sig = sig + noise;
	sig = Mix(sig);

	// filters
	filterFreq = LFNoise2.kr(0.3, 900, 1000);
	sig = sig * BPF.ar(sig, filterFreq, 10 / filterFreq);
	sig = LPF.ar(sig, 1500);


	// space
	sig = CombC.ar(sig, 1, 1, -12);

	sig = sig;
}.play;
)