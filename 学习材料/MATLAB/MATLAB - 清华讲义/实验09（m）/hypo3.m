%H0:mu<=mu0,H1:mu>mu0
x=[1.08 0.93 1.08 0.94 0.97 1.19 1.17 1.27 0.99 1.10];
xbar=mean(x);s=std(x);n=length(x);
mu0=1
%case1
alpha=0.05
u0=norminv(1-alpha);
t0=tinv(1-alpha,9);
sigma1=0.10;
u1=(xbar-mu0)*sqrt(n)/sigma1;
[hz1,pz1]=ztest(x,mu0,sigma1,alpha,1);
sigma2=0.15;
u2=(xbar-mu0)*sqrt(n)/sigma2;
[hz2,pz2]=ztest(x,mu0,sigma2,alpha,1);
t=(xbar-mu0)*sqrt(n)/s;
[ht,pt]=ttest(x,1,alpha,1);
['     sigma   ' '  u(t)   '  '   u0(t0)   ' '   h      ' '   p      ' ]
[sigma1,u1,u0,hz1,pz1;sigma2,u2,u0,hz2,pz2;s,t,t0,ht,pt]

%case2
alpha=0.01
u0=norminv(1-alpha);
t0=tinv(1-alpha,9);
sigma1=0.10;
u1=(xbar-mu0)*sqrt(n)/sigma1;
[hz1,pz1]=ztest(x,mu0,sigma1,alpha,1);
sigma2=0.15;
u2=(xbar-mu0)*sqrt(n)/sigma2;
[hz2,pz2]=ztest(x,mu0,sigma2,alpha,1);
t=(xbar-mu0)*sqrt(n)/s;
[ht,pt]=ttest(x,1,alpha,1);
['     sigma   ' '  u(t)   '  '   u0(t0)   ' '   h      ' '   p      ' ]
[sigma1,u1,u0,hz1,pz1;sigma2,u2,u0,hz2,pz2;s,t,t0,ht,pt]

%case3
mu1=1.08,
alpha=0.05
t0=tinv(1-alpha,9);
tbeta=t0-(mu1-mu0)*sqrt(n)/s
beta=tcdf(tbeta,9)

alpha=0.01,
t0=tinv(1-alpha,9);
tbeta=t0-(mu1-mu0)*sqrt(n)/s
beta=tcdf(tbeta,9)

