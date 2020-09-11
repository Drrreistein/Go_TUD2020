'Case 1 using normfit' 
M=dlmread('studentdata.m','\t');
student=[M(:,[1,2]);M(:,[3,4]);M(:,[5,6]);M(:,[7,8]);M(:,[9,10])];
stht=[student(:,1)];
%stwt=[student(:,2)];
[mu1 sigma1 muci1 sigmaci1]=normfit(stht,0.05),pause
%[mu2 sigma2 muci2 sigmaci2]=normfit(stwt,0.05),pause

'Case 2 When the sigma is given by using std command.'
'The height of the students.'
x1=mean(stht)
y1=std(stht)
u1=norminv(0.975);
low1=x1-u1*y1/sqrt(size(stht,1));
up1=x1+u1*y1/sqrt(size(stht,1));
[low1, up1],pause

'The weight of the students.'
%x2=mean(stwt)
%y2=std(stwt)
%low2=x2-u1*y2/sqrt(size(stwt,1));
%up2=x2+u1*y2/sqrt(size(stwt,1));
%[low2,up2],pause

'Case 3: Using student-t distribution'
'The height of the students.'
x1=mean(stht)
y1=std(stht)
t1=tinv(0.975,size(stht,1)-1);
low1=x1-t1*y1/sqrt(size(stht,1));
up1=x1+t1*y1/sqrt(size(stht,1));
[low1, up1]

%'The weight of the students.'
%x2=mean(stwt)
%y2=std(stwt)
%low2=x2-u1*y2/sqrt(size(stwt,1));
%up2=x2+u1*y2/sqrt(size(stwt,1));
%[low2,up2]
