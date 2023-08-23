x_values = -0.1:0.01:1.8;
figure
subplot(2,2,1)
NFgf = fitdist ( NFplv' ,'Normal');
% NFgf = fitdist ( normalFrequentPLV' ,'Normal');
plot(x_values,pdf(NFgf,x_values));
title("Normal Frequent");

subplot(2,2,2)
NRgf = fitdist ( NRplv' ,'Normal');
% NRgf = fitdist ( normalRarePLV' ,'Normal');
plot(x_values,pdf(NRgf,x_values));
title("Normal Rare");

subplot(2,2,3)
ADFgf = fitdist ( ADFplv' ,'Normal');
% ADFgf = fitdist ( ADFrequentPLV' ,'Normal');
plot(x_values,pdf(ADFgf,x_values));
title("AD Frequent");

subplot(2,2,4)
ADRgf = fitdist ( ADRplv' ,'Normal');
% ADRgf = fitdist ( ADRarePLV' ,'Normal');
plot(x_values,pdf(ADRgf,x_values));
title("AD Rare");