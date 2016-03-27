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
	filterFreq = LFNoise2.kr(0.3, 900, 1000); // 1000 ± 900hz is our frequency for the BPF - 0.3 has it moving fairly slowly
	sig = BPF.ar(sig, filterFreq, 10 / filterFreq); // arg3 is rq, which is generally (bandwidth / freq), so this is a bandwidth of 10
	// that means: if filterFreq == 400, this will only let sounds through between 390 and 410, roughly

	sig = LPF.ar(sig, 1500); // a simple LPF - everything above 1500hz is filtered


	// space
	sig = CombC.ar(sig, 1, 1, -12);

	sig = sig; // it's quiet now, so actually I want it louder
}.play;
)