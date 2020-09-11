function y=shier(t,x)
r=1;d=0.5;a=0.1;b=0.02;
%y=diag([r-a*x(2),-d+b*x(1)])*x;
y=[(r-a*x(2))*x(1),(-d+b*x(1))*x(2)]';