function [f, g]=shili0841(x)
%global a b d e

a=[1.25,8.75,0.5,5.75,3,7.25];
b=[1.25,0.75,4.75,5,6.5,7.75];
d=[3,5,4,7,6,11];
e=[20,20];
f1=0;
for i=1:6		% x(1:6): volume from (x(13), x(14)) to (a(i),b(i))
   s(i)=sqrt((x(13)-a(i))^2+(x(14)-b(i))^2);
   f1=s(i)*x(i)+f1;
end
f2=0;
for i=7:12		% x(7:12): volume from (x(15), x(16)) to (a(i),b(i))
   s(i)=sqrt((x(15)-a(i-6))^2+(x(16)-b(i-6))^2);
   f2=s(i)*x(i)+f2;
end
f=f1+f2;
for i=1:6
   g(i)=x(i)+x(i+6)-d(i); % 各工地用量必须满足
end
g(7)=sum(x(1:6))-e(1);
g(8)=sum(x(7:12))-e(2); % 各料场运送量不超过日储量
