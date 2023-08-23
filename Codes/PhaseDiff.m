figure
subplot(2,2,1);
polarhistogram(double(phaseCalc(normal(1))))
title('patient 1 Normal frequent')
subplot(2,2,2);
polarhistogram(double(phaseCalc(AD(1))))
title('patient 1 AD frequent')

subplot(2,2,3);
group = normal;
meanPH_N = 0;
for patient = 1:15    
    meanPH_N = meanPH_N+phaseCalc(group(patient));
end
meanPH_N = meanPH_N/15;
polarhistogram(double(meanPH_N))
title('mean Normal frequent')

subplot(2,2,4);
meanPH_AD = 0;
group = AD;
for patient = 1:13  
    meanPH_AD = meanPH_AD+phaseCalc(group(patient));
end
meanPH_AD = meanPH_AD/13;

polarhistogram(double(meanPH_AD))
title('mean AD frequent')

function phDif = phaseCalc(patientEEG)
    SR = 200; % Sample Rate
    epoch = patientEEG.epoch;
    odors = patientEEG.odor;
    trials =  size(epoch,3);
    filterRange = [35 40];
    filterData = filter(fir1(50, 2/SR*filterRange),1, epoch, [], 2); 
    %fir1 -> Designs filter    

    hilberted(1,:,:) = hilbert(filterData(2, :, :)); %Fz
    hilberted(2,:,:) = hilbert(filterData(3, :, :)); %Cz
    
    nTrial = 0;
    phDif = 0;
    
    for trial = 1:trials
        if odors(trial)== 0
            nTrial = nTrial+1;
            phase = angle(hilberted(1,:,:).*conj(hilberted(2,:,:)));
            phDif = mean(phase,3);
            
        end
    end

   
    
end


