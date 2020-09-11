d=100;
ts=0:0.1:50;
x0=[0,d];
[t,x]=ode45('chuan',ts,x0);
n=length(x); T=50; t=ts'; 
while min(abs(x(n,1)),abs(x(n,2)))>=0.0005
   T=T+0.1; 
   t1=[T-0.1,T]; x1=x(n,:);
   [t2,x2]=ode45('chuan',t1,x1); n1=length(t2);
   n=n+1; 
   x=[x;x2(n1,:)];
   t=[t;T];
end
n1=length(t);
[t(1:10),x(1:10,:)],
[t((n1-10):n1),x((n1-10):n1,:)],   
T
pause
plot(t,x), grid,xlabel('t'),ylabel('x1, x2'), gtext('x1(t)'), gtext('x2(t)'),
pause
plot(x(:,1),x(:,2)), grid, xlabel('x1'), ylabel('x2')
pause
v1=1; v2=2;
k=v1/v2;
x1=d/2*((x(:,2)/d).^(1-k)-(x(:,2)/d).^(1+k));
[x(1:10,:),x1(1:10)],
[x((n1-10):n1,:),x1((n1-10):n1)], 
