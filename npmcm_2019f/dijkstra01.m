% load and clean data
% data_origin = xlsread('??1????1-??.xlsx');
% data_origin = xlsread('??2????2-??.xlsx');
% save data_set1 data_origin
% save data_set2 data_origin
load('data_set1');
params1 = [25, 15, 20, 25, 30, 0.001];
params2 = [20, 10, 15, 20, 20, 0.001];
params = params1;
% params = params2;
alpha1=params(1);alpha2=params(2);beta1=params(3);beta2=params(4);theta=params(5);delta=params(6);
% figure;hold on;
% scatter3(data_origin(:,2),data_origin(:,3),data_origin(:,4),'x');
% scatter3(data_origin(1,2),data_origin(1,3),data_origin(1,4),'ro');
% scatter3(data_origin(end,2),data_origin(end,3),data_origin(end,4),'ro');
%%
data = data_origin;

data_num = size(data,1);
data(:,7) = zeros(data_num, 1); % add error_horizontal
data(:,8) = zeros(data_num, 1); % add error_vertical
data(:,9)=inf(data_num, 1); % add min distance from A to here
data(:,10) = zeros(data_num,1); % initialize previous node
A = data(1,:);

data(1, :) = []; % delete start point

B = data(end,:);

%%

% initialize
S = 0; % a set, includes all points, whoes min_distance was found
T = data(:,1)'; % a set, includes all points, whose min_distance was not found
current = A;
while ~isempty(T)
    
    min_dist_this_round = inf;
    index=0;
    for i=1:size(T,2)
        dist = pdist([current(2:4); data(T(i), 2:4)], 'euclidean'); % space distance btw. 2 points
        
        if data(T(i),10)==0
            err_h=dist*delta;err_v=err_h;
            dist_path = dist;
        else
            err_h = data(data(T(i),10),7) + dist*delta;
            err_v = data(data(T(i),10),8) + dist*delta;
            dist_path = dist + data(data(T(i),10),9);
        end
        
        % clear horizontal error
        if err_h<beta1 && err_v<beta2 && data(T(i),5)==0 && dist_path<data(T(i),9)
            data(T(i),9) = dist_path; % update min_dist
            data(T(i),10) = current(1); % update previous node
            data(T(i),7)=0;
            data(T(i),8)=err_v;
            
            if dist_path<min_dist_this_round
                min_dist_this_round=dist_path;
                index = i;
            end
        end
        
        % clear verical  error
        if err_h<alpha1 && err_v<alpha2 && data(T(i),5)==1 && dist_path<data(T(i),9)
            data(T(i),9) = dist_path; % update min_dist
            data(T(i),10) = current(1); % update previous node
            data(T(i),7)=err_h;
            data(T(i),8)=0;
            
            if dist_path<min_dist_this_round
                min_dist_this_round=dist_path;
                index = i;
            end
        end
        
    end
    
    % update current node
    current = data(T(index),:);
    S = [S current(1)]; % add current point into S
    T(index) = []; % remove current point from T
    if current(1) == data_num && current(7)<thata && current(8)<theta
        disp(['arrive end point, shortest path is:' num2str(S)]);
        return
    end
    
end

