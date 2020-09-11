x0=[-1.9,2];
n=zeros(4,2);
format short e
fopt=foptions;
fopt(7)=1;
[xbfgs,opt]=fminu('rosen',x0,fopt,'gradrosen')
vbfgs=rosen(xbfgs)
n(1,:)=[opt(10),opt(11)]
'-------------- BFGS: hybrid 2,3 poly-----------------------'
pause
fopt(6)=1;
[xdfp,opt]=fminu('rosen',x0,fopt,'gradrosen')
vdfp=rosen(xdfp)
n(2,:)=[opt(10),opt(11)]
'-------------- DFP: hybrid 2,3 poly----------------------'
pause
fopt(6)=0;
fopt(7)=0;
[xbfgs2,opt]=fminu('rosen',x0,fopt,'gradrosen')
vbfgs2=rosen(xbfgs2)
n(3,:)=[opt(10),opt(11)]
'--------------- BFGS: 3 poly interpolation ----------------------'
pause
fopt(6)=1;
[xdfp2,opt]=fminu('rosen',x0,fopt,'gradrosen')
vdfp2=rosen(xdfp2)
n(4,:)=[opt(10),opt(11)]
'---------------- DFP: 3 poly interpolation ---------------------'
pause
'++++++++++++     results of solutions +++++++++++++++++++++'
[xbfgs;xdfp;xbfgs2;xdfp2]
'---------------  values and iteration no. of algorithms ----------------------'
[[vbfgs,vdfp,vbfgs2,vdfp2]',n]
