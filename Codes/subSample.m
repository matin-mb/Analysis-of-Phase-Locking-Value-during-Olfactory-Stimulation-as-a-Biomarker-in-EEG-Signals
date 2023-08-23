function subSampledEpoch = subSample(UnsampledEpoch)
% This function prepare subsamples of the epoch

subSampledEpoch(1,:,:) = UnsampledEpoch(1,:,:);
subSampledEpoch(2,:,:) = UnsampledEpoch(5,:,:);
subSampledEpoch(3,:,:) = UnsampledEpoch(10,:,:);
subSampledEpoch(4,:,:) = UnsampledEpoch(15,:,:);


end