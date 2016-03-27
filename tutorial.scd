(
{
	var sig, noise, width, freq = 280, filterFreq;

	freq = freq * [1, 5/4, 6/4];    // use freq as the root, and do 1/1, 5/4, 6/4 intervals
	width = LFNoise2.kr([1.3, 1.4, 2.5], 0.5, 0.5);

	// source
	sig = Saw.ar(freq, width);
	noise = sig * WhiteNoise.ar(0.5);
	sig = sig + noise;
	sig = Mix(sig);

	// filters
	filterFreq = LFNoise2.kr(0.3, 900, 1000);
	sig = sig * BPF.ar(sig, filterFreq, 10 / filterFreq);
	sig = LPF.ar(sig, 1500);

	// space
	sig = CombC.ar(sig, 1, 1, -12);
	sig = FreeVerb.ar(sig);

	sig = sig * 10;
}.play;

)