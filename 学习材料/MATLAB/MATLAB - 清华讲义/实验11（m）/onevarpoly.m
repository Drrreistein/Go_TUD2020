x1=17:2:29;x=[x1,x1];
y=[20.48 25.13 26.15 30.0 26.1 20.3 19.35  24.35 28.11 26.3 31.4 26.92 25.7 21.3]; 
[p,S]=polyfit(x,y,2);p
[Y,delta]=polyconf(p,x,S);Y
pause
polytool(x,y,2)
%[z,delta]=polyconf(p,x,S,0.01);
%z
pause
y1=mean(y);
rsquare=sum((Y-y1).^2)/sum((y-y1).^2)
s=sqrt(sum((y-Y).^2)/11)