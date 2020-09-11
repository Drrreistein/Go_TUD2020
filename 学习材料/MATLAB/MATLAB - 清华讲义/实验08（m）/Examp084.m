x0=[-1.9,2];opt(1)=0;
[x1,opt]=constr('rosenf084',x0,opt);
x1,
[z1,dz1]=rosenf084(x1),
n1=opt(10)
pause

[x2,opt]=constr('rosenf084',x0,opt,[],[],'rosen084');
x2,
[z2,dz2]=rosenf084(x2)
n2=opt(10)
pause

xx=[x1;x2],z=[z1;z2],n=[n1;n2]
