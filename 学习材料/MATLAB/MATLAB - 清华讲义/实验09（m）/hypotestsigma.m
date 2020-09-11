alpha=0.05;
sigma0=0.3;
n=20;
x=[49.8 50.1 50.5 49.7 49.0 50.0 50.3 50.0 49.9 49.9 50.5 49.2 49.7 49.8 50.1 50.0 50.3 50.2 50.4 50.1];
s2=var(x)
chi2alpha=chi2inv(1-alpha,n-1)
chi2=(n-1)*s2/(sigma0^2)
if chi2<=chi2alpha H0=0
else H0=1
end
