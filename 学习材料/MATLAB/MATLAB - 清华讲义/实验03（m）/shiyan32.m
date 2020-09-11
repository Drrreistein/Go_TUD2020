t=0:pi/10:pi/2;
z=weixing(t);
l1=4*trapz(t,z)
l2=4*quad('weixing',0,pi/2,1e-6)

