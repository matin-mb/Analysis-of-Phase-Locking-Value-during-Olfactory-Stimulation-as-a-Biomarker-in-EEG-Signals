function epochMatrix = epoch(eegData)
%This function epochs the pre-processed data in the
%desired format

for j = 1 : 19
    for i = 1 : 120
        epochMatrix(j,:,i) = eegData(j,(i*2000-599):(i*2000));    
    end        
end

end