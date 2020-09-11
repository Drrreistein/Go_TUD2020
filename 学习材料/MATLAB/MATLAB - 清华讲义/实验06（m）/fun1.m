function y=fun1(x)
a=1;b=0.3;
sigma=a/b;
x0=0.98;y0=0.02;
y=1/sigma*log(x/x0)-x+x0+y0;