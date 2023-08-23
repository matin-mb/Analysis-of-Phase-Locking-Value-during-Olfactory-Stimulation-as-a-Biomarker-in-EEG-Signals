% EPOCHING
function epochMatrix=epoching(InputSignal, BS, FS, StimuliOnset)

T=InputSignal(1,2)-InputSignal(1,1);

for trialNum=1:max(InputSignal(10,:))
    stimuliIndices=find(InputSignal(10,:)~=trialNum, nnz(InputSignal(10,:)));
    
    tempIndices=zeros(1,nnz(InputSignal(10,:))/4);
    
    for n=0:size(tempIndices,2)-1
        tempIndices(n+1)=stimuliIndices(4*n+1);
    end
    
    stimuliIndices=tempIndices;

    stimuliIndices=stimuliIndices(stimuliIndices<stimuliIndices(1,1)+ceil(30/T));

    currentTrialMatrix=[];

    for k=1:size(stimuliIndices,2)

        upperBound=stimuliIndices(1,k)+floor(FS/T);
        lowerBound=stimuliIndices(1,k)-floor(BS/T);

        if lowerBound>0 && upperBound<=size(InputSignal,2)
            currentTrialMatrix=[currentTrialMatrix InputSignal(2:9, ...
                (lowerBound):(upperBound))];

        elseif lowerBound<=0 && upperBound<=size(InputSignal,2)
            currentTrialMatrix=[currentTrialMatrix InputSignal(2:9, ...
                (1):(upperBound))];

        elseif lowerBound<=0 && upperBound>size(InputSignal,2)
            currentTrialMatrix=[currentTrialMatrix InputSignal(2:9, ...
                (1):(size(InputSignal,2)))];

        elseif lowerBound>0 && upperBound>size(InputSignal,2)
            currentTrialMatrix=[currentTrialMatrix InputSignal(2:9, ...
                (lowerBound):(size(InputSignal,2)))];

        end

    end

    maxIndices=find(InputSignal(10,:)~=max(InputSignal(10,:), nnz(InputSignal(10,:))));
    maxTempIndices=zeros(1,nnz(InputSignal(10,:))/4);
    for n=0:size(maxTempIndices,2)-1
        maxTempIndices(n+1)=maxIndices(4*n+1);
    end
    maxIndices=maxTempIndices;
    maxIndices=maxIndices(maxIndices<maxIndices(1,1)+ceil(30/T));
    maxColumns=size(maxIndices,2)*(floor(FS/T)+floor(BS/T)+1);

    epochMatrix(:,:,trialNum)=[currentTrialMatrix zeros(8,maxColumns-size(currentTrialMatrix,2))];
end
end