clc;clear all;close all;
name_str={ '富氧率','透气性指数','CO','H2','CO2','标准风速','富氧流量','冷风流量','鼓风动能','炉腹煤气量','炉腹煤气指数','理论燃烧温度','顶压','顶压2','顶压3','富氧压力','冷风压力','全压差','热风压力','实际风速','热风温度','顶温东北','顶温西南','顶温西北','顶温东南','阻力系数','鼓风湿度','设定喷煤量','本小时实际喷煤量','上小时实际喷煤量'};
%% 读取储存数据
% % chos=[2:5,11:15,22:26];
% chos=[1:26];
% name_str=name_str(chos);
% for i1=1:8
%     i1
%     load(strcat('K:\GL_data\3\','data_',num2str(i1),'.mat'));
%     for i2=1:floor((length(date0)-500)/10)+1
% %         if i2==3179
% %             fprintf('%d:%d\n',i1,i2);
% %         end
% %         fprintf('%d:%d\n',i1,i2);
%         data1=data0(1+10*(i2-1):500+10*(i2-1),chos);
%         M(i2,:)=mean(data1);
%         S(i2,:)=std(data1);
%         ind=S(i2,:)<1e-3;
%         if sum(ind)>0
%             S(i2,ind)=S(i2-1,ind);
%         end
%         data2=guiyihua(data1,M(i2,:),S(i2,:));
%         [p,te]=pca(data2');
%         for i3=1:size(p,2)
%             P(:,i2,i3)=p(:,i3);
%         end
%         Te(:,i2)=te;
%     end
%     save(strcat('K:\GL_data\3\','pca_model_',num2str(i1),'.mat'),'M','S','P','Te');
%     clear M S P Te;
% end
%% 导入模型
i1=1;
load(strcat('K:\GL_data\3\','pca_model_',num2str(i1),'.mat'));
load(strcat('K:\GL_data\3\','data_',num2str(i1),'.mat'));
datestr(date0(end),'yyyy-mm-dd HH:MM:SS')


%% 对输入量归一化
% M_train=mean(data_train0);
% S_train=std(data_train0);
% data_train1=guiyihua(data_train0,M_train,S_train);%训练集
% data_test1=guiyihua(data_test0,M_train,S_train);%测试集
%% 
% figure,plot(1:size(date,1),datenum(date)); %采样时间分布不均匀，周期一个小时
%% sfa
% m=5;
% x=data_train1';%训练集
% [s,W,S2]=sfa(x);%训练模型
% y=data_test1';%测试集
% [T1,Te,S1,Se]=sfa_indicater(y,W,S2,m);
% figure;
% subplot(2,2,1);
% plot(T1);title('T1');
% subplot(2,2,2);
% plot(Te);title('Te');
% subplot(2,2,3);
% plot(S1);title('S1');
% subplot(2,2,4);
% plot(Se);title('Se');
%% pca
% x=data_train1';%训练集
% [P,te]=pca(x);%训练模型
% m=find(tril(ones(size(x,1)),0)*diag(te)/sum(sum(te))<0.95,1,'last');
% y=data_test1';%测试集
% [T2,SPE]=pca_indicater(y,P,te,m);
% figure;
% subplot(2,1,1);
% plot(T2);title('T2');
% subplot(2,1,2);
% plot(SPE);title('SPE');