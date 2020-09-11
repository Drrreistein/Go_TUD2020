function xdot=cun(t,x)
v1=1; v2=2; 
xdot=[v1-v2*x(1)/sqrt(x(1)^2+x(2)^2),-v2*x(2)/sqrt(x(1)^2+x(2)^2)]';