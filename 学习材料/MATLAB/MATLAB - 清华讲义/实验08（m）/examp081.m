% max  z=3*x1+x2
% s.t. -x1+x2<=2
%      x1-2*x2<=2
%      3*x1+2*x2<=14
%      x1,x2>=0
c=-[3,1];a=[-1,1;1,-2;3,2];b=[2,2,14];
v1=[0 0];   
' ------  command one: x=lp(c,a,b,v1) --------'
x=lp(c,a,b,v1)
z=-c*x  %x= (4,1),max z= 13
pause
' ------  command two: [x,lag]=lp(c,a,b,v1) --------'
[x,lag]=lp(c,a,b,v1)
z=-c*x
pause
' ------  command three: [x,lag]=lp(c,a,b) --------'
[x,lag]=lp(c,a,b)
z=-c*x
