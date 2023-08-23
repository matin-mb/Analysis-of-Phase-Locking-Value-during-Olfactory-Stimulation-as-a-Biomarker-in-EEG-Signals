
figure
subplot(2,2,1)
boxplot(NFplv);
title("Normal Frequent");
grid on;
subplot(2,2,2)
boxplot(NRplv);
title("Normal Rare");
grid on;
subplot(2,2,3)
boxplot(MFplv);
title("MCI Frequent");
grid on;
subplot(2,2,4)
boxplot(MRplv);
title("MCI Rare");
grid on;