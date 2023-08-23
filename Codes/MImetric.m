

function [MI,KL]= modulationIndex(phase,amplitude,nBins)
amplQ=ones(1,nBins)./nBins;
amplP = binAmp(nBins,phase,amplitude);
KL=sum(amplP.*log(amplP./amplQ));
MI= KL./log(nBins);
end

function amplP = binAmp(nBins,phase,amplitude)

binEdges=linspace(-pi,pi,nBins+1);
[~,binIdx]=histc(phase,binEdges);

amplBin=zeros(1,nBins);
for bin=1:nBins
    if any(binIdx==bin)
        amplBin(bin)=mean(amplitude(binIdx==bin)); % Only bin Index
    end
end
amplP=amplBin/sum(amplBin);

end