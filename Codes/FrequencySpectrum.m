
freqPlotter(EEG.data(5,:),200,1000) % Channel Fz -> data(5,:)

function freqPlotter( signal , fs , samples)
    %fs -> Sampling frequency
    Y = fft ( signal ,samples);
    f = fs *(0 : samples -1) / samples;
    % We use fftshift() to cover the negative frequencies as well
    y = fftshift (Y);
    figure
    plot (f-fs /2, abs (y)) 
    xlabel ('frequency (hz)');
    ylabel ('Magnitude (v)');
    title("Sample2 Channel Fz frequency Spectrum")
    grid on
end