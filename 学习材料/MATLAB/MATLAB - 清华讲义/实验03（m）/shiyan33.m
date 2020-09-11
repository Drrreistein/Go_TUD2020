a=1.2;b=0.8;
m=0;z=0;
n=1000;
for i=1:n
   x=rand(1,2);
   y=0;
   if x(1)^2+x(2)^2<=1
      y=exp(-0.5*(a^2*x(1)^2+b^2*x(2)^2));
      z=z+y;
      m=m+1;
   end
end
P=4*a*b*z/2/pi/n,
m