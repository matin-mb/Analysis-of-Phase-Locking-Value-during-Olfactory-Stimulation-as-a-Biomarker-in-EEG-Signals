
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
boxplot(ADFplv);
title("AD Frequent");
grid on;
subplot(2,2,4)
boxplot(ADRplv);
title("AD Rare");
grid on;