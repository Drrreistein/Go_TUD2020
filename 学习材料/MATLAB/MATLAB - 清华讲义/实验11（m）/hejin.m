x0=0.1:0.01:0.18;x=[x0,0.2,0.21,0.23]';
y=[42,41.5,45,45.5,45,47.5,49,55,50,55,55.5,60.5]';
X=[ones(12,1),x];
[b,bint,r,rint,stat]=regress(y,X);
b,bint,r,rint,stat,
pause
rcoplot(r,rint),
pause
x1=[x(1:7);x(9:12)];
y1=[y(1:7);y(9:12)];
X1=[ones(11,1),x1];
[b,bint,r,rint,stat]=regress(y1,X1);
b,bint,stat,
pause
rcoplot(r,rint),
