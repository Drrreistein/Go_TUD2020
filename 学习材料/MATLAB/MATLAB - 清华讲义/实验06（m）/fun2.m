function y=fun2(x)
a=0.8;b=0.25;r=0.04;l=0.5;P0=10000;F=25;gamma=1.4;
y=F*a*cos(x)*(l-b*tan(x))^gamma-pi*r^2*b*P0*l^gamma;