M=dlmread('studentdata.m','\t');
student=[M(:,[1,2]);M(:,[3,4]);M(:,[5,6]);M(:,[7,8]);M(:,[9,10])];
stht=[student(:,1)];
stwt=[student(:,2)];
%student height
mu=167.5;
alpha=0.05;
[hht,pht,ciht]=ttest(stht,mu,alpha)
pause
%student weight
mu=60.2;
alpha=0.05;
[hwt,pwt,ciwt]=ttest(stwt,mu,alpha,1)
