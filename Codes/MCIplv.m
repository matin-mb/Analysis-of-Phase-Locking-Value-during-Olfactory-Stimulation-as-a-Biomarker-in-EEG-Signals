load Normal.mat
load MCI.mat


% PLV of Normal Group
group = normal;
patientsNum = size(group,2);
for patient = 1 : patientsNum     
    NFplv(patient) = myPLV(group(patient),0); % Freq
    NRplv(patient) = myPLV(group(patient),1); % Rare
end

% PLV of AD Group
group = MCI;
patientsNum = size(group,2);
for patient = 1 : patientsNum      
    MFplv(patient) = myPLV(group(patient),0); %Freq
    MRplv(patient) = myPLV(group(patient),1); % Rare
end

function MCIplv = myPLV(patientEEG, type)
    samples = 600;
    SR = 200; 
    epoch = patientEEG.epoch;    
    Ntrials =  size(epoch,3);
    freqRange = [35 40];   % Gamma Range 
    %b = fir1(n,Wn) uses a Hamming window to design an nth-order lowpass, bandpass, or multiband FIR filter with linear phase. The filter type depends on the number of elements of Wn.
    b = fir1(50, 2/SR*freqRange);
    % y = filter(b,a,x,zi,dim) acts along dimension dim. For example, if x is a matrix, then filter(b,a,x,zi,2) returns the filtered data for each row.
    filterData = filter(b ,1, epoch, [], 2); %fir1 -> Designs filter    

    hilberted(1,:,:) = hilbert(filterData(2, :, :)); %Fz
    hilberted(2,:,:) = hilbert(filterData(3, :, :)); %Cz

    odors = patientEEG.odor;
    nTrial = 0;
    for trial = 1:Ntrials
        if odors(trial)==type
            nTrial = nTrial+1;
            phi = angle(hilberted(1,:,trial).*conj(hilberted(2,:,trial)));
            plvSum(trial) = abs(sum(exp(1i*phi))/samples);            
        end
    end
    MCIplv =sum(plvSum)/nTrial;
end
