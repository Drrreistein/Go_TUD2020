%alpha=0.05;
alpha=0.1;
alpha1=1-alpha/2;
ualpha=norminv(alpha1)
sigma=1;
u=50;
xbar=49.65;
n=25;
z=abs(xbar-u)/(sigma/sqrt(n))
if z<=ualpha H0=0
else H0=1
end
