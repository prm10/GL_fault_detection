clc;clear all;close all;
name_str={ '富氧率','透气性指数','CO','H2','CO2','标准风速','富氧流量','冷风流量','鼓风动能','炉腹煤气量','炉腹煤气指数','理论燃烧温度','顶压','顶压2','顶压3','富氧压力','冷风压力','全压差','热风压力','实际风速','热风温度','顶温东北','顶温西南','顶温西北','顶温东南','阻力系数','鼓风湿度','设定喷煤量','本小时实际喷煤量','上小时实际喷煤量'};
%% 读取储存数据
load data_正常_2012-10-01.mat;
chos=[1:26];
data_train0=data0(1:4000,chos);
data_test0=data0(40001:440000,chos);
%% 对输入量归一化
M_train1=mean(data_train0);
S_train1=std(data_train0);
data_train1=guiyihua(data_train0,M_train1,S_train1);%训练集
M_test1=mean(data_test0);
S_test1=std(data_test0);
data_test12=guiyihua(data_test0,M_test1,S_test1);
data_test11=guiyihua(data_test0,M_train1,S_train1);%测试集
%% pca
[P1,te1]=pca(data_train1');%训练模型
[P2,te2]=pca(data_test12');
P3=P2'*P1;
T1=data_train1*P1;
T2=data_test12*P2;
T22=data_test11*P1;
% imshow(abs(P3));

figure;
hold on;
scatter(T1(:,1),T1(:,2),'b.');
% scatter(T2(:,1),T2(:,2),'r.');
for i1=1:5
    range=i1*40000;%每隔5天约40000个点
    data1=data0(range:range+1000,chos);
    data2=guiyihua(data1,M_train1,S_train1);
    data3=data2*P1;
    scatter(data3(:,1),data3(:,2),'.');
end
fh=@(x,y)x^2/te1(1)+y^2/te1(2)-4;
h=ezplot(fh,[min(T1(:,1))-20,max(T1(:,1))+20,min(T1(:,2))-20,max(T1(:,2))+20]);
set(h,'linewidth',2,'color','r','linestyle','-.');
hold off;
title('训练集与测试集第一第二主成分散点图');
xlabel('t1');ylabel('t2');
legend('训练集','一天后','两天后','三天后','四天后','五天后','T^2阈值');

% figure;
% hold on;
% i1=1;
% scatter3(T22((i1-1)*4000+1:i1*4000,1),T22((i1-1)*4000+1:i1*4000,2),T22((i1-1)*4000+1:i1*4000,3),'.');
% i1=4;
% scatter3(T22((i1-1)*4000+1:i1*4000,1),T22((i1-1)*4000+1:i1*4000,2),T22((i1-1)*4000+1:i1*4000,3),'.');
% hold off;
%% sfa
% [s1,W,S2]=sfa(data_train1');%训练模型
% s2=W*data_test11';%测试集
% S1=s1';
% S2=s2';
% figure;
% hold on;
% scatter(S1(:,1),S1(:,2),'b.');
% scatter(S2(:,1),S2(:,2),'g.');
% hold off;
% title('训练集与测试集第一第二慢成分散点图');
% xlabel('s1');ylabel('s2');
% legend('训练集','测试集');

