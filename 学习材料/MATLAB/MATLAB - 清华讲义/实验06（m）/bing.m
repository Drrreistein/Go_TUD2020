a=1;b=0.3;
sigma=a/b;
x0=0.98;y0=0.02;
x=0.01:0.01:1;
y1=0;;y2=1-x;
y=1/sigma*log(x/x0)-x+x0+y0;
plot(x,y,x,y1,'r',x,y2,'b'),grid,
newton1(0.1,20,1e-4)
x=1/sigma;
if x<x0
   ym=1/sigma*log(x/x0)-x+x0+y0
else
ym=y0
end
