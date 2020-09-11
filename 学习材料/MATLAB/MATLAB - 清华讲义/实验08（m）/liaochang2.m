function [f,g]=liaochang2(x,a,b,d,e)
f=x(1:12)*[sqrt((x(13)-a).^2+(x(14)-b).^2),sqrt((x(15)-a).^2+(x(16)-b).^2)]';
A=[eye(6),eye(6);ones(1,6),zeros(1,6);zeros(1,6),ones(1,6)];
g=A*x(1:12)'-[d,e]';

