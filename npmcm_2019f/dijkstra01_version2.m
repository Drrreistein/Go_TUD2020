clear all;clc;
% load and clean data
% data_origin = xlsread('??1????1-??.xlsx');
% data_origin = xlsread('??2????2-??.xlsx');
% save data_set1 data_origin
% save data_set2 data_origin

load('data_set1');
% load('data_set2');
params1 = [25, 15, 20, 25, 30, 0.001];
params1 = [25, 15, 20, 25, 30, 0.001];
global params;
% params1 = [20, 10, 15, 20, 20, 0.001];
params = params1;
% params = params2;

%%
% data = data_origin(1:10,:);
global data
data = data_origin;

data_num = size(data,1);
data(:,7) = zeros(data_num, 1); % add error_horizontal
data(:,8) = zeros(data_num, 1); % add error_vertical
data(:,9)=inf(data_num, 1); % add min distance from A to here
data(:,10) = NaN(data_num,1); % initialize previous node
data(1,9) =0;
A = data(1,:);
B = data(end,:);
data(1, :) = []; % delete start point
% data(504:606,:)=[];
% data(400:500,:)=[];
% data(300:360,:)=[];
% data(220:290,:)=[];
% data(180:210,:)=[];
% data(100:160,:)=[];
% data(1:90,:)=[];
data(:,1)=1:size(data,1);
%%

% initialize
S = []; % a set, includes all points, whoes min_distance was found
T = data(:,1)'; % a set, includes all points, whose min_distance was not found
current = A;
path=[0];
dfs(current, T, path, data);

function dfs(current, T ,path, data)
    % terminate
    if length(path)>=10
%         disp(path)
        return 
    end
    
    if current(1)==(length(data))
        disp(path)    
        return
    end
    
while ~isempty(T)
    
    global params
    alpha1=params(1);alpha2=params(2);beta1=params(3);beta2=params(4);theta=params(5);delta=params(6);
    global data
    
    for i=1:length(T)
        
        % space distance btw. 2 points
        dist = pdist([current(2:4); data(T(i), 2:4)], 'euclidean');
        
        % compute vertical and horizontal error
        err_h = current(7) + dist*delta;
        err_v = current(8) + dist*delta;
        dist_path = current(9) + dist; % ?????????+????
        
        % clear horizontal error
        if err_h<beta1 && err_v<beta2 && data(T(i),5)==0 && dist_path<data(T(i), 9)
            data(T(i),9) = dist_path; % update min_dist
            data(T(i),10) = current(1); % update previous node
            data(T(i),7)=0;
            data(T(i),8)=err_v;
        end
        
        % clear verical  error
        if err_h<alpha1 && err_v<alpha2 && data(T(i),5)==1 && dist_path<data(T(i),9)
            data(T(i),9) = dist_path; % update min_dist
            data(T(i),10) = current(1); % update previous node
            data(T(i),7)=err_h;
            data(T(i),8)=0;
        end
        
        % check if end point arrived
        if T(i)==data(end,1) && err_v<theta && err_h<theta && dist_path<data(T(i),9)
            data(T(i),9) = dist_path; % update min_dist
            data(T(i),10) = current(1); % update previous node
            data(T(i),7)=err_h;
            data(T(i),8)=err_v;
        end
        
    end
    
    % find n nearest points to search
    n=min([length(T),length(data(:,9)~=inf),2]);
    data_tmp = data(T,:);
    arr = findMinDist(data_tmp(:,9),n);
    current_queue =data_tmp(arr,:);
    
    for i=1:size(current_queue,1)
        current =current_queue(i,:);
        tmp = current(1);
        T(find(T==tmp))=[];
        dfs(current, T, [path tmp],data);
        T=[T tmp];
    end
%     T(find(T==current(1)))=[];
    return
end

%     if current(1)==(length(data))
%         path=[data_num-1]; % end point
%         dat = data(2:end,:);
%         m=size(dat,1);
%         while m~=0
%             m=dat(m,10);
%             path=[path m];
%         end
%         path
%         return
%     end
    
end


%% generate path
% path=[data_num-1]; % end point
% dat = data(2:end,:);
% m=size(dat,1);
% while m~=0
%     m=dat(m,10);
%     path=[path m];
% end
% path

%% plot results
% figure;hold on;
% scatter3(data(:,2),data(:,3),data(:,4),'x');
% scatter3(data(1,2),data(1,3),data(1,4),'ro');
% scatter3(data(end,2),data(end,3),data(end,4),'ro');
% path=path(1:end-1);
% plot3(dat(path,2),dat(path,3),dat(path,4), 'k')
% plot3([data(1,2) dat(path(end),2)],[data(1,3) dat(path(end),3)],[data(1,4) dat(path(end),4)], 'k')
% axis equal
% xlabel('x');ylabel('y');zlabel('z');

%%
function arr = findMinDist(data, n)
[~,tmp] = sort(data);
arr = tmp(1:n);
end

