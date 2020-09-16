clear all;clc;
% load and clean data
% data_origin = xlsread('??1????1-??.xlsx');
% data_origin = xlsread('??2????2-??.xlsx');
% save data_set1 data_origin
% save data_set2 data_origin

load('data_set1');
% load('data_set2');
params1 = [25, 15, 20, 25, 30, 0.001];
% params1 = [20, 10, 15, 20, 20, 0.001];
params = params1;
% params = params2;
alpha1=params(1);alpha2=params(2);beta1=params(3);beta2=params(4);theta=params(5);delta=params(6);

%%
% data = data_origin(1:10,:);
data = data_origin;

data_num = size(data,1);
data(:,7) = zeros(data_num, 1); % add error_horizontal
data(:,8) = zeros(data_num, 1); % add error_vertical
data(:,9)=inf(data_num, 1); % add min distance from A to here
data(:,10) = NaN(data_num,1); % initialize previous node
data(1,9) =0;
A = data(1,:);

% data(1, :) = []; % delete start point

B = data(end,:);

%%

% initialize
S = []; % a set, includes all points, whoes min_distance was found
T = data(:,1)'; % a set, includes all points, whose min_distance was not found

while ~isempty(T)
    
    data_tmp = data(T+1,:);
    [~, hh ]= min(data_tmp(:,9));
    current=data_tmp(hh,:);
    T(find(T==data_tmp(hh,1))) = []; % remove node with min distance to Start from T
    S = [S data_tmp(hh,1)]; % add the
    
    %     reminder = 0;
    for i=1:length(T)
        %         if i==503
        % %             pause(1);
        %         end
        
        % space distance btw. 2 points
        dist = pdist([current(2:4); data(T(i)+1, 2:4)], 'euclidean');
        
        % compute vertical and horizontal error
        if data(T(i)+1,10)>=0 && data(T(i)+1,10)<=data_num % not NaN
            err_h = data(data(T(i)+1,10)+1,7) + dist*delta;
            err_v = data(data(T(i)+1,10)+1,8) + dist*delta;
            dist_path = data(data(T(i)+1,10)+1,9) + dist; % ?????????+????
            
            %             err_h = current(7) + dist*delta;
            %             err_v = current(8) + dist*delta;
            %             dist_path = current(9) + dist; % ?????????+????
        else
            err_h=dist*delta;
            err_v=dist*delta;
            dist_path = dist;
        end
        
        % clear horizontal error
        if err_h<beta1 && err_v<beta2 && data(T(i)+1,5)==0 && dist_path<data(T(i)+1, 9)
            data(T(i)+1,9) = dist_path; % update min_dist
            data(T(i)+1,10) = current(1); % update previous node
            data(T(i)+1,7)=0;
            data(T(i)+1,8)=err_v;
            %             reminder =1;
        end
        
        % clear verical  error
        if err_h<alpha1 && err_v<alpha2 && data(T(i)+1,5)==1 && dist_path<data(T(i)+1,9)
            data(T(i)+1,9) = dist_path; % update min_dist
            data(T(i)+1,10) = current(1); % update previous node
            data(T(i)+1,7)=err_h;
            data(T(i)+1,8)=0;
            %             reminder =1;
        end
        
        % check if end point arrived
        if T(i)==data(end,1) && err_v<theta && err_h<theta && dist_path<data(T(i)+1,9)
            data(T(i)+1,9) = dist_path; % update min_dist
            data(T(i)+1,10) = current(1); % update previous node
            data(T(i)+1,7)=err_h;
            data(T(i)+1,8)=err_v;
            %             reminder =1;
        end
        
    end
    
    
    if data_tmp(hh)==data(end,1)
        disp('got it:');
        break;
    end
    
end

%% generate path
path=[data_num-1]; % end point
dat = data(2:end,:);
m=size(dat,1);
while m~=0
    m=dat(m,10);
    path=[path m];
end
path

%% plot results
figure;hold on;
scatter3(data(:,2),data(:,3),data(:,4),'x');
scatter3(data(1,2),data(1,3),data(1,4),'ro');
scatter3(data(end,2),data(end,3),data(end,4),'ro');
path=path(1:end-1);
plot3(dat(path,2),dat(path,3),dat(path,4), 'k')
plot3([data(1,2) dat(path(end),2)],[data(1,3) dat(path(end),3)],[data(1,4) dat(path(end),4)], 'k')
axis equal
xlabel('x');ylabel('y');zlabel('z');
%%
%
% % searchPath
% dat = data(2:end,:);
% searchPath(dat,size(dat,1));
%
% function searchPath(dat, n)
% m = dat(n,10);
% %     PATH= [PATH m];
% disp([num2str(m)])
% if m~=0
%     searchPath(dat, dat(n,10));
% end
%
% end



