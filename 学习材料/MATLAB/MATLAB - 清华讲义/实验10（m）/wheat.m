%read data from 'wheatdata.m'
x=dlmread('wheatdata.m','\t');
p=anova2(x,2)