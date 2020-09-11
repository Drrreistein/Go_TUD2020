c=ones(1,7);
a=ones(7);a1=triu(a,1);a3=triu(a,3);a5=tril(a,-5);
A=-(a-a1+a3-a5)
b=-[50 50 50 50 80 90 80]';
v1=zeros(1,7);
' ----------- case 1 ----------'
x=lp(c,A,b,v1)
z=c*x
y=-A*x
' ----------- case 2 ----------'
b1=b;
b1(7)=-90;
x1=lp(c,A,b1,v1)
z1=c*x1
y1=-A*x1
%ceil(x1-1.0e-10)
%
' ----------- case 3 ----------'
c3=[200*ones(1,7) 12*ones(1,7)];
a=ones(7);a1=triu(a,1);a3=triu(a,3);a5=tril(a,-5);
A1=-(a-a1+a3-a5);
A3=[A1 -0.5*eye(7);zeros(1,7) 0.5*ones(1,7)];
b3=-[50 50 50 50 80 90 80 -450/4]';
v3=zeros(1,14);
x3=lp(c3,A3,b3,v3);
x3'
z3=c3*x3
