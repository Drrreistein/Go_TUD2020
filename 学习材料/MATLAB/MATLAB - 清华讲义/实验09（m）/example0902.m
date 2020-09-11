x=0.9,y1=norminv(x),x1=normcdf(y1),
pause

x=0.5,x2=tcdf(x,10),y2=tinv(x2,10),
pause

a=2;b=3;n=10;
[mu1,sigma1]=normstat(a,b);[mu1,sigma1],pause
[mu2,sigma2]=tstat(n);[mu2,sigma2],pause
[mu3,sigma3]=chi2stat(n);[mu3,sigma3],pause
[mu4,sigma4]=fstat(a,n);[mu4,sigma4]



