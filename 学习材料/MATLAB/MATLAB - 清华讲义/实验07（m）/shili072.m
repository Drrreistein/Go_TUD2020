x0=[1,0,40];
[x,opt,f]=leastsq('fun074',x0);x,
y=f'*f,%�������ƽ����
t1=0:0.1:12;
y1=fun074(x,t1);
hold on
plot(t1,y1)
xlabel('ʱ����')
ylabel('ѪҩŨ��')
hold off