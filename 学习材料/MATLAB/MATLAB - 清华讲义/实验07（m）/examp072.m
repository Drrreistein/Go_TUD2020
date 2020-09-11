x0=[1,1];a=10;b=1;
format short e
fopt=foptions;
fopt(1)=1;
[x,fopt]=fminu('fun071',x0,fopt,'',a,b);
x,f=fopt(8),n=fopt(10)
pause

fopt(2:3)=1e-8;
[x,fopt]=fminu('fun071',x0,fopt,'',a,b);
x,f=fopt(8),n=fopt(10)
pause

fopt(2:3)=1e-10;
[x,fopt]=fminu('fun071',x0,fopt,'',a,b);
x,f=fopt(8),n=fopt(10)

