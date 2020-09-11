% The first method
T=[68,87,106,140];
P=[9.7981,13.324,9.0078,13.355,9.7918,14.277,9.6563,12.463];
K=[0.0848,0.0897,0.0762,0.0807,0.0696,0.0753,0.0611,0.0651];
T0=99; P0=10.3;
x(1)=interp1(P(1:2),K(1:2),P0);
x(2)=interp1(P(3:4),K(3:4),P0);
x(3)=interp1(P(5:6),K(5:6),P0);
x(4)=interp1(P(7:8),K(7:8),P0);
% »­²ÝÍ¼
plot(T,x,'r+',T,x)
xlabel('T'), ylabel('K'), 
pause
% ¶þ´ÎÄâºÏ
aa=polyfit(T,x,2);
a=aa(1)
b=aa(2)
c=aa(3)
K0=polyval(aa,T0)
T1=68:0.1:140;
K1=polyval(aa,T1);
plot(T,x,'r+',T1,K1,T0,K0,'r*')
xlabel('T'), ylabel('K') 
