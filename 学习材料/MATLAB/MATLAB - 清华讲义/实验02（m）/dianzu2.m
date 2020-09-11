t=[20.5 32.5 51 73 95.7];
r=[765 826 873 942 1032];                  
a=polyfit(t,r,1); 
%R=[t' ones(5,1)]; % r1=t,r2=1
%a=R\r';% Ra=r
a1=a(1)
a2=a(2)
y=polyval(a,t);
plot(t,r,'k+',t,y,'r')

