function newSub = setupSubject(Subject)
% This function sets the subjects up to be be imported in EEGLAB

newSub = transpose(table2array(Subject)); 
% It should be transposed to reshape:
% rows -> Channels
% columns -> Samples
newSub = newSub(1:19,:); % Channel-19 is neglected

end