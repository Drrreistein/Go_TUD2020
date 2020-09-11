
M=dlmread('studentdata.m','\t');
student=[M(:,[1,2]);M(:,[3,4]);M(:,[5,6]);M(:,[7,8]);M(:,[9,10])];
[N,X]=hist(student(:,1))
pause
hist(student(:,1),10)
title('Histogram for the Height of the Students');
pause
[N,X]=hist(student(:,2))
pause
hist(student(:,2),10)
title('Histogram for the Weight of the Students');
