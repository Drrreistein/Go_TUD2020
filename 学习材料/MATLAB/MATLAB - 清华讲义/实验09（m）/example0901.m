%Normal Distribution with mu=0 and sigma=1
x=-9:0.1:9;
p1=normpdf(x);

%Normal Distribution with mu=0 and sigma=3
mu=0;sigma=3;
p2=normpdf(x,mu,sigma);
q2=normcdf(x,mu,sigma);

%Normal Distribution with mu=2 and sigma=3
mu=2;sigma=3;
p3=normpdf(x,mu,sigma);


subplot(2,2,1),plot(x,p1),title('PDF of N(0,1)')
subplot(2,2,2),plot(x,p2),title('PDF of N(0,3)')
subplot(2,2,3),plot(x,q2),title('CDF of N(0,3)')
subplot(2,2,4),plot(x,p3),title('PDF of N(2,3)')


