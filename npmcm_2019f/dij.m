clc
clear all
%% Dijkstra Algorithm
%所有的问题都可以转化为从初始点出发,只需选取部分邻接矩阵即可
%定义不可联通两点之间的距离为Inf
Inf=100000;
%邻接矩阵
a=[0 50 Inf 40 25 10;50 0 15 20 Inf 25;Inf 15 0 10 20 Inf;...
    40 20 10 0 10 25;25 Inf 20 10 0 55;10 25 Inf 25 55 0];
%把需要遍历的点存入到v之中,还未遍历的点对应的索引置置为0
%改变v的长度就可以更改为求解从初始点到任意点的距离
v(1:length(a))=0;
%初始点到自身的距离为0,v(1)置为1
v(1)=1;
%S集合存放已经被遍历过并求出最短距离的点
s_index=1;
%将初始距离设为Inf,当有最短距离求出时,二者取小更新distance
distance(1:length(a))=Inf;
%初始点到自身的距离为0
distance(1)=0;
%可更改任意,这里设为初始点
temp=1;
while sum(v)<length(a)%当v中还有未被遍历的点时,循坏继续
    %找出v中未被遍历的点,命名为to be
    tb=find(v==0);
    %注意到这里的tb是一个集合
    %比较与初始的distance中直连距离与间接距离的大小,取二者中的最小值
    distance(tb)=min(distance(tb),distance(temp)+a(temp,tb));
    %找到更新的tb中的最小值的索引, 作为下一次判断的初始点
    tmpb=find(distance(tb)==min(distance(tb)));
    %可能会有多个待选点,为了节省判断,默认第一个,并得到真实的索引值(tb中的索引是不完整的)
    temp=tb(tmpb(1));
    %将该点在v中的索引置为1,表明已被遍历
    v(temp)=1;
    %将该点加入到S集合中
    s_index=[s_index,temp];
end