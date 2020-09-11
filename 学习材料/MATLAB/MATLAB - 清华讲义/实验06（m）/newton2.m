function y=newton2(x01,x02,n,eps)
x(1)=x01;x(2)=x02;
b=1;
i=2;
while (abs(b)>eps*x(i))
   x(i+1)=x(i)-fun2(x(i))*(x(i)-x(i-1))/(fun2(x(i))-fun2(x(i-1)));
   b=x(i+1)-x(i);
   i=i+1;
   if(i>n)error('n is full');
      return;
   end
   
end
 y=x(i);i