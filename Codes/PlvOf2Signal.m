function  plv  = PLV( sig1, sig2 )
fs = 200;

% BPS1 = bandpass(sig1,[35 40],fs);
% BPS2 = bandpass(sig2,[35 40],fs);

phase_sig1 = angle(hilbert(sig1)); 
phase_sig2 = angle(hilbert(sig2)); 
z1 = sig1 + 1i*hilbert(sig1);
z2 = sig2 + 1i*hilbert(sig2);
%phaseDiff = phase_sig1 - phase_sig2;

Ntrials = 600;
phaseDiff = angle(z1.*conj(z2));
% compute PLV
e = exp(1i*(phaseDiff));
plv = abs(sum(e)  / Ntrials );

end
