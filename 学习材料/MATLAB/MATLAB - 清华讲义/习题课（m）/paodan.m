a=0.8;b=0.5;p=0.4;m=0;z=0;
n=100000;
for i=1:n
   x=2*rand(1,2)-1;
   y=0;
   if x(1)^2+x(2)^2<=1
      y=exp(-0.5/(1-p*p)*(x(1)^2/a^2+x(2)^2/b^2-2*p*x(1)*x(2)/a/b));
      z=z+y;
      m=m+1;
   end
end
P=4*z/2/pi/a/b/sqrt(1-p*p)/n,m