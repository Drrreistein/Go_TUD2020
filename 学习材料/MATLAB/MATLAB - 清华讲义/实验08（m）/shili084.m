% P227
%global a b d e
%a=[1.25,8.75,0.5,5.75,3,7.25];
%b=[1.25,0.75,4.75,5,6.5,7.75];
%d=[3,5,4,7,6,11];
%e=[20,20];
%
' ------------- case 1 ----------------'
%for i=1:6		% x(1:6): volume from (x(13), x(14)) to (a(i),b(i))
%   c(i)=sqrt((a(i)-5)^2+(b(i)-1)^2);
%end
%for i=7:12		% x(7:12): volume from (x(15), x(16)) to (a(i),b(i))
 %  c(i)=sqrt((a(i-6)-2)^2+(b(i-6)-7)^2);
%end
%A=[eye(6),eye(6);
 %  ones(1,6),zeros(1,6);
  % zeros(1,6),ones(1,6)];
%b1=[d,e];
%[y,lag]=lp(c,A,b1,zeros(1,12),[],[],6)
%minf = c*y
' ------------- case 2 ----------------'
x0=[zeros(1,12) 5 1 2 7]; % 取原料场位置为新料场位置的初值
v1=zeros(1,12);
%op=foptions;
op(13)=6;	% Number of equality constraints
op(14)=2000;
[x,op]=constr('shili0841',x0,op,v1),
f=op(8),n=op(10)

%[f,g]=shili0841(x)