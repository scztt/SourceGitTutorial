(
{
	var sig, noise, width, freq = 280, filterFreq;

	freq = freq * [1, 5/4, 6/4];
	width = LFNoise2.kr([1.3, 1.4, 2.5], 0.5, 0.5);

	// source
	sig = Saw.ar(freq, width);
	noise = sig * WhiteNoise.ar(0.5);
	sig = sig + noise;
	sig = Mix(sig);

	// filters
	filterFreq = LFNoise2.kr(0.1, [400, 900, 1800], [500, 1000, 2000]); // three filterFreqs, with three ranges... also, since we have more, lower the speed
	sig = sig * BPF.ar(sig, filterFreq, 4 / filterFreq); // three filterfreqs means three BPF's - lower the bandwidth too
	sig = Mix(sig); // mix them
	sig = LPF.ar(sig, 900); // lower by LPF freq a little too

	// space
	sig = CombC.ar(sig, 1, 1, -12);
	sig = FreeVerb.ar(sig, 0.6, 0.8, 0.2); // fiddle with the reverb a little

	sig = sig * 10;
}.play;


)