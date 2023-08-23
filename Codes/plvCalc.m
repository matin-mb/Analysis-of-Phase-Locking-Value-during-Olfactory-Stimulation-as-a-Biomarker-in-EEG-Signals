
load Normal.mat
load AD.mat
% PLV for normal

fs = 200;
sumNormalFrequentPLV = 0; %15 members
sumNormalRarePLV = 0; %15 members
Frequent = 0;
Rare = 0;
 for i = 1:15
    %SignalChannel2=[];
    matrix1 = normal(i).epoch(2,:,:);
    SignalChannel2 = reshape(matrix1,1,[]); % convert matrix to row vector

    matrix2 = normal(i).epoch(3,:,:);
    SignalChannel3 = reshape(matrix2,1,[]); % convert matrix to row vector
    
    BPS1 = bandpass(SignalChannel2,[35 40],fs);
    BPS2 = bandpass(SignalChannel3,[35 40],fs);
    [normal1Size,~] = size(normal(i).odor);
    
    matrix1 = reshape(BPS1, 600, normal1Size ); %use 10 columns and as many rows as necessary
    matrix2 = reshape(BPS2, 600, normal1Size ); %use 10 columns and as many rows as necessay


     for j = 1:normal1Size
        if (normal(i).odor(j) == 0)  %lemon - Frequent
            Frequent = Frequent + 1;
            sumNormalFrequentPLV = sumNormalFrequentPLV + PlvOf2Signal(matrix1(:,j),matrix2(:,j));

        else %Rose - Rare
            Rare = Rare + 1;
            sumNormalRarePLV = sumNormalRarePLV + PlvOf2Signal(matrix1(:,j),matrix2(:,j));

        end
     end

      normalFrequentPLV(i) = sumNormalFrequentPLV/Frequent ;
      normalRarePLV(i) = sumNormalRarePLV/Rare;
 end      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLV for AD
 

sumADFrequentPLV = 0; %13 members
sumADRarePLV = 0; %13 members
Frequent = 0;
Rare = 0;
 for i = 1:13
    %SignalChannel2=[];
    matrix1 = AD(i).epoch(2,:,:);
    SignalChannel2 = reshape(matrix1,1,[]); % convert matrix to row vector

    matrix2 = AD(i).epoch(3,:,:);
    SignalChannel3 = reshape(matrix2,1,[]); % convert matrix to row vector
    
    BPS1 = bandpass(SignalChannel2,[35 40],fs);
    BPS2 = bandpass(SignalChannel3,[35 40],fs);
    [AD1Size,~] = size(AD(i).odor);
    
    matrix1 = reshape(BPS1, 600, AD1Size ); %use 10 columns and as many rows as necessary
    matrix2 = reshape(BPS2, 600, AD1Size ); %use 10 columns and as many rows as necessay


     for j = 1:AD1Size
        if (AD(i).odor(j) == 0)  %lemon - Frequent
            Frequent = Frequent + 1;
            sumADFrequentPLV = sumADFrequentPLV + PlvOf2Signal(matrix1(:,j),matrix2(:,j));
        else %Rose - Rare
            Rare = Rare + 1;
            sumADRarePLV = sumADRarePLV + PlvOf2Signal(matrix1(:,j),matrix2(:,j));

        end
     end
     
      ADFrequentPLV(i) = sumADFrequentPLV/Frequent ;
      ADRarePLV(i) = sumADRarePLV/Rare;


       

 end