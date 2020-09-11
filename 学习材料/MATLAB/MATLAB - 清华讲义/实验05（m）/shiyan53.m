k=4;
A=[10 3 1;2 -10 3;1 3 10]
b=[14 -5 14]';
L=-tril(A,-1)
U=-triu(A,1)
D=diag(diag(A))

B1=D\(L+U);
f3=norm(B1);
f1=D\b;
x=zeros(3,1)
for i=1:k
   x=B1*x+f1
end

B2=(D-L)\U;
f4=norm(B2);
f2=(D-L)\b;
y=zeros(3,1);
for i=1:k
   y=B2*y+f2;
end
y


