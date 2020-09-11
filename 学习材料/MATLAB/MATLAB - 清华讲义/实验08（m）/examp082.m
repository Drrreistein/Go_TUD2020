% min  z=x1+x2
% s.t. x1-x2<=1,x1>=0
c=[1,1];a=[1,-1];b=1;
x=lp(c,a,b)
z=c*x
pause
'------ Command one ------'
v1=0;
x=lp(c,a,b,v1)
z=c*x
pause
'------ Command two ------'
c=[1,1];a=[1,-1;-1,0];b=[1,0];
x=lp(c,a,b)
z=c*x
