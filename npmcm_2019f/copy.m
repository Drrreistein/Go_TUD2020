%%%%%%%%%%%%%%%%%%%%%%%%%

PATH=cell(10000,1);
SENDNEW=SSSNEW;

for i=1:10^4
    b=sparse(SENDNEW);
    [dist,path,pred] = graphshortestpath(b,1,613);
    
    %??1,2,3,??
    if ismember(path(2),verticaldata)==1
        if S(path(1),path(2))<=25/0.001 & S(path(1),path(2))<=15/0.001
            if S(path(2),path(3))<=20/0.001 & ( S(path(1),path(2))+S(path(2),path(3)) ) <=25/0.001
                path=path;
            else
                SENDNEW(path(2),path(3))=0;SENDNEW(path(3),path(2))=0;
                %path=[];
                continue;
            end
        else
            SENDNEW(path(1),path(2))=0;SENDNEW(path(2),path(1))=0;
            %path=[];
            continue;
        end
    elseif ismember(path(2),standarddata)==1
        if S(path(1),path(2))<=20/0.001 & S(path(1),path(2))<=25/0.001
            if S(path(2),path(3))<=15/0.001 & (S(path(1),path(2))+S(path(2),path(3)) ) <=25/0.001
                path=path;
            else
                SENDNEW(path(2),path(3))=0;SENDNEW(path(3),path(2))=0;
                %path=[];
                continue;
            end
        else
            SENDNEW(path(1),path(2))=0;SENDNEW(path(2),path(1))=0;
            %path=[];
            continue;
        end
    end
    
    %?????
    flag=0;
    for m=3:length(path)-1
        if ismember(path(m),verticaldata)==1
            if ( S(path(m-2),path(m-1)) + S(path(m-1),path(m)) )<=25/0.001 & S(path(m-1),path(m))<15/0.001
                path=path;
                
            else
                SENDNEW(path(m-1),path(m))=0;SENDNEW(path(m),path(m-1))=0;
                %path=[];
                flag=1;
                break;
                
            end
            
        elseif ismember(path(m),standarddata)==1
            if (S(path(m-2),path(m-1)) + S(path(m-1),path(m)))<=25/0.001 & S(path(m-1),path(m))<20/0.001
                path=path;
            else
                SENDNEW(path(m-1),path(m))=0;SENDNEW(path(m),path(m-1))=0;
                %path=[];
                flag=1;
                break;
                
            end
        end
    end
    
    if flag==1
        continue;
    end
    
    %????
    if ( S( path(size(path,2)-2),path(size(path,2)-1) )+S( path(size(path,2)-1),613 ) )<30/0.001
        path=path;
    else
        SENDNEW(613,path(size(path,2)-1))=0;
        SENDNEW(path(size(path,2)-1),613)=0;
        %path=[];
        continue;
    end
    
    %????
    flagbb=0;
    for j=2:length(path)-1
        if ( ismember(path(j),verticaldata) && ismember(path(j+1),verticaldata) ) || ( ismember(path(j),standarddata) && ismember(path(j+1),standarddata) )
            SENDNEW(path(j),path(j+1))=0;
            SENDNEW(path(j+1),path(j))=0;
            %path=[];
            flagbb=1;
            break;
        end
    end
    if flagbb==1
        continue;
    end
    
    %????2 ??
    %?????????????
    %???????
    flagcc=0;
    for nv=2:length(path)-1
        cosalpha=( (S(path(nv-1),path(nv)))^2+(S(path(nv),path(nv+1)))^2-(S(path(nv-1),path(nv+1)))^2 )/( 2*S(path(nv-1),path(nv))*S(path(nv),path(nv+1)) );
        sinbeita=abs(cosalpha);
        if 200*sinbeita*2<=S(path(nv),path(nv+1))
            path=path;
        else
            SENDNEW(path(nv),path(nv+1))=0;SENDNEW(path(nv+1),path(nv))=0;
            flagcc=1;
            break;
        end
    end
    if flagcc==1
        continue;
    end
    
    %%%%%%%%%%%%%%%%%????3 ?n-2 ?????
    flagdd=0;
    for ok=3:length(path)-3
        
        if ismember(path(ok),wrong_point)
            if S(path(ok),path(ok+1))+S(path(ok+1),path(ok+2))<=20/0.001
                path=path;
            else
                SENDNEW(path(ok),path(ok+1))=0;SENDNEW(path(ok+1),path(ok))=0;
                flagdd=1;
                break;
            end
        end
    end
    if flagdd==1
        continue;
    end
    %%%%%%%%%%%%%???? n-2 ????
    %     if S(path(length(path)-2),path(length(path)-1))+S(path(length(path)-1),path(length(path)))<25/0.001
    %         path=path;
    %     else
    %         SENDNEW(path(length(path)-2),path(length(path)-1))=0;SENDNEW(path(length(path)-1),path(length(path)-2))=0;
    %         continue;
    %     end
    
    
    %??????????
    wrong_save=[];
    for okj=1:length(path)
        if ismember(path(okj),wrong_point)
            wrong_save=[wrong_save,okj];%
        end
    end
    
    %??????path ???????????
    PATH{i}=path;
    countt=0;
    for k=1:size(PATH,1)
        countt=countt+~isempty(PATH{k});
    end
    if countt~=0
        break;
    end
    
end

