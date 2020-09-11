M=dlmread('studentdata.m','\t');
student=[M(:,[1,2]);M(:,[3,4]);M(:,[5,6]);M(:,[7,8]);M(:,[9,10])];
stht=[student(:,1)];
stwt=[student(:,2)];
normplot(stht)
title('Student Height')
pause
normplot(stwt)
title('Student Weight')
