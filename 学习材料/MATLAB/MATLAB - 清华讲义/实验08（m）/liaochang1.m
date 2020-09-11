function [f,g]=liaochang1(x,a,b,d,e)
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
   g(i)=x(i)+x(i+6)-d(i); 
end
g(7)=sum(x(1:6))-e(1);
g(8)=sum(x(7:12))-e(2); 

