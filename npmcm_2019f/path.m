function p=path(k,index)
p(1)=k;
m=1;
while index(k)~=1
    k=index(k);
    p(m+1)=k;
    m=m+1;
end
p=flip(p);
p=[1,p];
end