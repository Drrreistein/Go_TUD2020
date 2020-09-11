% The second method
T=[68,68,87,87,106,106,140,140];
P=[9.7981,13.324,9.0078,13.355,9.7918,14.277,9.6563,12.463];
K=[0.0848,0.0897,0.0762,0.0807,0.0696,0.0753,0.0611,0.0651];
T0=99; P0=10.3;
x=sqrt(P)./T;
plot(x,K,'r+')
xlabel('sqrt(P)/T'), ylabel('K')
pause
aa=polyfit(x,K,1);
a=aa(1)
b=aa(2)
x0=sqrt(P0)/T0;
K0=polyval(aa,x0)
K1=polyval(aa,x);
plot(x,K,'k+',x,K1,x0,K0,'r*')
xlabel('sqrt(P)/T')
ylabel('K')