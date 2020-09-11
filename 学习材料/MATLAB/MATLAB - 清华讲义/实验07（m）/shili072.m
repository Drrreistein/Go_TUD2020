x0=[1,0,40];
[x,opt,f]=leastsq('fun074',x0);x,
y=f'*f,%计算误差平方和
t1=0:0.1:12;
y1=fun074(x,t1);
hold on
plot(t1,y1)
xlabel('时间轴')
ylabel('血药浓度')
hold off