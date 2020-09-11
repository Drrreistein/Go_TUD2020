ts=0:0.1:11;
%a=0.1745;
a=0.5236;
x0=[a,0];
[t,x]=ode23('danbai',ts,x0);
g=9.8;l=25;
z=a*cos(sqrt(g/l)*t);
[t,x(:,1),z]
