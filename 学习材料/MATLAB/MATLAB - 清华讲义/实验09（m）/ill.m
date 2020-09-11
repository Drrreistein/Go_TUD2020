%read data from 'illdata.m'
M=dlmread('illdata.m','\t');
%the data of the illness is in the first row. 
ill=[M(1,:)];
%the data of the normal is in the second row. 
nor=[M(2,:)];
%Histogram for the illness
hist(ill,6);
title('Histogram for the illness');
pause
%Histogram for the normal
hist(nor,7);
title('Histogram for the normal');
% to test that the two means are the same
[h,p,ci]=ttest2(ill,nor,0.05,0),pause
% to test that the two means are the same 
%when the last five data of the illness is delated
ill1=[ill(1:1:25)];
[h,p,ci]=ttest2(ill1,nor,0.05,0)
