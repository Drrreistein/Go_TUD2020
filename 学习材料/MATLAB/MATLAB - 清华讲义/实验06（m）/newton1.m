function y=newton1(x0,n,eps)
x(1)=x0;
c=1;
i=1;
while(abs(c)>eps*x(i))
   x(i+1)=x(i)-fun1(x(i))/dfun1(x(i));
   c=x(i+1)-x(i);
   i=i+1;
   if(i>n)error('n is full');
      return;
end
end
xinf=x(i),i
   