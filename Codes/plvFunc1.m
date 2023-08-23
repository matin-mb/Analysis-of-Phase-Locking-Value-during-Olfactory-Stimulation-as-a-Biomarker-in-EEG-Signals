function  plv  = PLV( sig1, sig2 , freqRange )
fs = 200; % Sampling Rate
 sig1 = bandpass(sig1,freqRange,fs);
 sig2 = bandpass(sig2,freqRange,fs);
% Hilbert Transform
phase_sig1 = angle(hilbert(sig1)); 
phase_sig2 = angle(hilbert(sig2)); 
phaseDiff = phase_sig1 - phase_sig2;

% Can be calculated in this way:
% z1 = sig1 + 1i*hilbert(sig1);
% z2 = sig2 + 1i*hilbert(sig2);
% phaseDiff = angle(z1.*conj(z2));

Ntrials = 600;
% compute PLV
e = exp(1i*(phaseDiff));
plv = abs(sum(e)  / Ntrials );

end
