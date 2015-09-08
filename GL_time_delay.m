clc;clear all;close all;
% date_str_begin=datestr([2013,02,15,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,02,28,00,00,00],'yyyy-mm-dd');
% [date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save data.mat date data;

% datestr(date(45506),'yyyy-mm-dd HH:MM:SS')

load data.mat;
% data=data(1:1000,:);
% data=data(80000:90000,:);
% for i1=1:size(data,2)
%     figure,plot(data(:,i1));title(num2str(i1));
% end
figure,plot(data);
data_train0=data(1:40000,:);
data_test0=data(40001:end,:);

% figure,hist(data_train0(:,1),50);

M_train=mean(data_train0);
S_train=std(data_train0);

data_train1=guiyihua(data_train0,M_train,S_train);
data_test1=guiyihua(data_test0,M_train,S_train);%测试集

% figure,plot(1:size(date,1),datenum(date)); %采样时间分布不均匀，周期一个小时

% [c,lags]=xcorr(data_train0,20);
% [~,index]=max(c);
% index2=find(index~=(length(lags)+1)/2);
% figure,plot(lags,c(:,index2(4)));

standard=data_train0(:,10);
delay=zeros(size(data,2),1);
for i1=1:size(data,2)
    [c,lags]=xcorr(standard,data_train0(:,i1),50);
    figure,plot(lags,c);
    [~,index]=max(c);
    delay(i1)=lags(index);
end


