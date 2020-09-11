       
     oldoptions=optimset('fminunc')
       options=optimset(oldoptions,'LargeScale','off')
       
       options11=optimset(options,'HessUpdate','dfp')
       [x11,fval11,exitflag11,output11]=fminunc('fun2', [-1.2 2],options11)
       pause
      
       options12=optimset(options,'HessUpdate','dfp','LineSearchType','cubicpoly')
       [x12,fval12,exitflag12,output12]=fminunc('fun2', [-1.2 2],options12)
       pause
       
       options21=optimset(options,'HessUpdate','bfgs')
       [x21,fval21,exitflag21,output21]=fminunc('fun2', [-1.2 2],options21)
       pause
       
       options22=optimset(options,'HessUpdate','bfgs','LineSearchType','cubicpoly')
       [x22,fval22,exitflag22,output22]=fminunc('fun2', [-1.2 2],options22)
       pause
       
       options31=optimset(options,'HessUpdate','steepdesc')
       [x31,fval31,exitflag31,output31]=fminunc('fun2', [-1.2 2],options31)
       pause
       
       options32=optimset(options,'HessUpdate','steepdesc','MaxIter',8000,'MaxFunEvals',8000)
       [x32,fval32,exitflag32,output32]=fminunc('fun2', [-1.2 2],options32)
       pause
       
       options33=optimset(options,'HessUpdate','steepdesc','MaxIter',9000,'MaxFunEvals',9000)
       [x33,fval33,exitflag33,output33]=fminunc('fun2', [-1.2 2],options33)
       