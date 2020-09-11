function [f,g]=liaochang3(x,a,b,d,e)
f=[x(1:6),d-x(1:6)]*[sqrt((x(7)-a).^2+(x(8)-b).^2),sqrt((x(9)-a).^2+(x(10)-b).^2)]';
A=[eye(6),zeros(6);ones(1,6),zeros(1,6);zeros(1,6),ones(1,6)];
g=A*[x(1:6),d-x(1:6)]'-[d,e]';
