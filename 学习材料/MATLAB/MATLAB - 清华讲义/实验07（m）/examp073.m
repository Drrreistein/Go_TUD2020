fopt(1)=0;
x0=[-1.9,2];
format short e
fopt=foptions;
fopt(14)=1000;
[xbfgs,opt]=fminu('rosen',x0,fopt)
vbfgs=rosen(xbfgs)
n(1)=opt(10)
'-------------- hybrid 2,3 poly-----------------------'
pause
fopt(6)=1;
[xdfp,opt]=fminu('rosen',x0,fopt)
vdfp=rosen(xdfp)
n(2)=opt(10)
'-------------- hybrid 2,3 poly----------------------'
pause
fopt(6)=2;
[xgrad,opt]=fminu('rosen',x0,fopt)
vgrad=rosen(xgrad)
n(3)=opt(10)
'--------------- hybrid 2,3 poly----------------------'
pause
fopt(6)=0;
fopt(7)=1;
[xbfgs2,opt]=fminu('rosen',x0,fopt)
vbfgs2=rosen(xbfgs2)
n(4)=opt(10)
'--------------- 3 poly interpolation ----------------------'
pause
fopt(6)=1;
fopt(7)=1;
[xdfp2,opt]=fminu('rosen',x0,fopt)
vdfp2=rosen(xdfp2)
n(5)=opt(10)
'---------------- 3 poly interpolation ---------------------'
pause
'++++++++++++     results of solutions +++++++++++++++++++++'
[xbfgs;xdfp;xgrad;xbfgs2;xdfp2]
'---------------  values of algorithms ----------------------'
[vbfgs,vdfp,vgrad,vbfgs2,vdfp2;n]'
