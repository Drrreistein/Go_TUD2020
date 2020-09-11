function root=HalfInterval(x^2+0.5,1,0,eps)  



function r=FindRoots(f,a,b,eps)
f1=subs(sym(f),findsym(sym(f)),a);
f2=subs(sym(f),findsym(sym(f)),b);
mf=subs(sym(f),findsym(sym(f)),(a+b)/2);
if(f1*mf>0)
    t=(a+b)/2;
    r=FindRoots(f,t,b,eps);
else
    if(f1*mf==0)
        r=(a+b)/2;
    else
        if(abs(b-a)<=eps)
            r=(b+3*a)/4;
        else
            s=(a+b)/2;
            r=FindRoots(f,a,s,eps);
        end
    end
end
    
