
% Taking 2 tests at same time:

[H0M ,PvalueM] = ttest2 ( MFplv ,ADFplv);
[H02M ,Pvalue2M] = ttest2 ( MRplv ,NRplv);

[H0 ,Pvalue] = ttest2 ( NFplv ,ADFplv);
[H02 ,Pvalue2] = ttest2 ( ADRplv ,NRplv);