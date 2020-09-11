op(1)=1;
op(14)=2000;
'-----------case 1-----------'
x0=[zeros(1,12),5 1 2 7];
%x0=rand(1,10).*[3 5 4 7 6 11 10 10 10 10];
v=zeros(1,12);
op(13)=6;
[x,op]=constr('lioch',x0,op,v);
x,f=op(8),n=op(10)
pause
'----------case 2-----------'
x0=[zeros(1,12),5 1 2 7];
%x0=rand(1,10).*[3 5 4 7 6 11 10 10 10 10];
v=zeros(1,12);
op(13)=6;
[x,op]=constr('liochh',x0,op,v);
x,f=op(8),n=op(10)
