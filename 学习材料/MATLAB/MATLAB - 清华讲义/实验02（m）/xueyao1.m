t=[0.25	0.5	1	1.5	2	3	4	6	8];
c=[19.21	18.15	15.36	14.10	12.89	9.32	7.45	5.24	3.01];
subplot(2,1,1),plot(t,c,'+'),xlabel('t'),ylabel('c')
pause
y=log(c);
subplot(2,1,2),semilogy(t,c,'+'),xlabel('t'),ylabel('logc')
