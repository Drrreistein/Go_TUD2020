y=dlmread('lampdata.m','\t')

% case 1: balanced anova
yy=y';
y1=[yy(1:5,1),[yy(6:9,1);1840],[yy(10:12,1);1840;1840],[yy(13:16,1);1840]];
p1=anova1(y1)
pause

% case 2: non-balanced anova
y2=[y(1,:)];
g=[y(2,:)];
p2=anova1(y2,g)
