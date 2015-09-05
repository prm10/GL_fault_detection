clc;close all;clear all;
%% 导入数据
%训练集
[u_tr,z_tr]=loaddata('d00');
u_mean=mean(u_tr,2);
u_std=std(u_tr,0,2);
z_mean=mean(z_tr,2);
z_std=std(z_tr,0,2);
% 标准化
u_tr=(u_tr-u_mean*ones(1,size(u_tr,2)))./(u_std*ones(1,size(u_tr,2)));
z_tr=(z_tr-z_mean*ones(1,size(z_tr,2)))./(z_std*ones(1,size(z_tr,2)));
%测试集
[u_te,z_te]=loaddata('d00_te');
%标准化
u_te=(u_te-u_mean*ones(1,size(u_te,2)))./(u_std*ones(1,size(u_te,2)));
z_te=(z_te-z_mean*ones(1,size(z_te,2)))./(z_std*ones(1,size(z_te,2)));

%% sf

m=2;
x=[u_tr;z_tr];
[s,W,S2]=sfa(x);
% figure;
% subplot(2,1,1);
% plot(x(1,:)');
% subplot(2,1,2);
% plot(s([1,20],:)');

[T1,Te,S1,Se]=sfa_indicater(x,W,S2,m);

figure;
subplot(2,2,1);
plot(T1);
subplot(2,2,2);
plot(Te);
subplot(2,2,3);
plot(S1);
subplot(2,2,4);
plot(Se);
