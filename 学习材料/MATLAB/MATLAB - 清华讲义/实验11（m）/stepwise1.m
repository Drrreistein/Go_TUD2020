M=dlmread('stepwise0.m','\t');
x=M(:,1:4);y=M(:,5);
stepwise(x,y)
