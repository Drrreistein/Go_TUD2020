a=[1.25 8.75 0.5  5.75 3   7.25];
b=[1.25 0.75 4.75 5    6.5 7.75];
d=[3 5 4 7 6 11];e=[20,20];
op(1)=0;op(14)=2000;
%x0=[zeros(1,12),5 1 2 7];
x0=rand(1,16).*ones(1,16);

v=zeros(1,12);op(13)=6;
[x,op]=constr('liaochang1',x0,op,v,[],[],a,b,d,e);
x1=[x(1:6);x(7:12)],y1=x(13:16)
f1=op(8),n1=op(10),pause

[x,op]=constr('liaochang2',x0,op,v,[],[],a,b,d,e);
x2=[x(1:6);x(7:12)],y2=x(13:16)
f2=op(8),n2=op(10),pause

%x0=[zeros(1,6),5 1 2 7];
x0=[x0(1:6),x0(13:16)];
v=zeros(1,6);op(13)=0;
[x,op]=constr('liaochang3',x0,op,v,[],[],a,b,d,e);
x3=[x(1:6);d-x(1:6)],y3=x(7:10)
f3=op(8),n3=op(10),pause

x=[x1;x2;x3],
y=[y1;y2;y3],
f=[f1,f2,f3], 
n=[n1,n2,n3],pause
plot(a,b,'+')
pause
hold on,plot(5,1,'^',2,7,'^'),hold off
pause
hold on,plot(y3(1),y3(2),'*',y3(3),y3(4),'*'),hold off
