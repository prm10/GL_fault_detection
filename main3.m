clc;close all;clear all;
%% 导入数据
%训练集
[u,z]=loaddata('d00');
u_mean=mean(u,2);
u_std=std(u,0,2);
z_mean=mean(z,2);
z_std=std(z,0,2);
% 标准化
u=(u-u_mean*ones(1,size(u,2)))./(u_std*ones(1,size(u,2)));
z=(z-z_mean*ones(1,size(z,2)))./(z_std*ones(1,size(z,2)));
%测试集
[u_te,z_te]=loaddata('d00_te');
%标准化
u_te=(u_te-u_mean*ones(1,size(u_te,2)))./(u_std*ones(1,size(u_te,2)));
z_te=(z_te-z_mean*ones(1,size(z_te,2)))./(z_std*ones(1,size(z_te,2)));
%% 根据最终预报误差确定序列长度N
for i1=1:4
    % 基于训练集训练Markov模型
    N=i1;
    [g,lumda]=Markov(z,u,N);
    % 基于测试集计算最终预报误差
    z_te1=MIMOpredict(u_te,g);
    V0(i1)=sum(sum((z_te-z_te1).^2));
end
plot(V0);
xlabel('序列长度N');ylabel('训练集的最终预报误差V');title('根据最终预报误差确定序列长度N');
%% 可视化d00_te.dat测试集的预报效果
% 基于训练集训练Markov模型
N=1;
[g,lumda]=Markov(z,u,N);
% 基于测试集计算最终预报误差
z_te1=MIMOpredict(u_te,g);
V0(i1)=sum(sum((z_te-z_te1).^2))/size(z_te,2);
for j1=1:11
    figure;
    plot(N+1:size(z_te,2),z_te(j1,N+1:end),N+1:size(z_te,2),z_te1(j1,N+1:end));
    xlabel('k');ylabel('value');title(strcat('输出z',num2str(j1),'真实值与预报值'));
    legend('真实值z','预报值z1');
end
%% 基于最终预报误差的故障诊断
for i1=0:21
    %导入数据
    str1=strcat('d',num2str(i1,'%.2d'),'_te');
    [u,z]=loaddata(str1);
    %标准化
    u_mean=mean(u,2);
    u_std=std(u,0,2);
    z_mean=mean(z,2);
    z_std=std(z,0,2);
    u=(u-u_mean*ones(1,size(u,2)))./(u_std*ones(1,size(u,2)));
    z=(z-z_mean*ones(1,size(z,2)))./(z_std*ones(1,size(z,2)));
    % 训练Markov模型
    N=1;
    [g,lumda]=Markov(z,u,N);
    % 对测试集进行测试
    for i2=0:21
        str2=strcat('d',num2str(i2,'%.2d'),'_te');
        [u_te,z_te]=loaddata(str2);
        %标准化
        u_te=(u_te-u_mean*ones(1,size(u_te,2)))./(u_std*ones(1,size(u_te,2)));
        z_te=(z_te-z_mean*ones(1,size(z_te,2)))./(z_std*ones(1,size(z_te,2)));
        z_te1=MIMOpredict(u_te,g);
        V(i2+1,i1+1)=sum(sum((z_te-z_te1).^2))/size(z_te,2);%故障状态全部加1，即:1~22
    end
end
[~,result1]=min(V);
[~,result2]=sort(V);
%故障诊断结果相应的全部减1，即：0~21
result1=result1-1;
result2=result2-1;