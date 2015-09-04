clc;clear all;close all;
% date_str_begin=datestr([2013,02,15,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,02,28,00,00,00],'yyyy-mm-dd');
% [date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save data.mat date data;

% datestr(7.352898758101852e+05,'yyyy-mm-dd HH:MM:SS')

load data.mat;
figure,plot(data);

data_train0=data(1:40000,:);
data_test0=data(40001:end,:);

M_train=mean(data_train0);
S_train=std(data_train0);

data_train1=guiyihua(data_train0,M_train,S_train);
data_test1=guiyihua(data_test0,M_train,S_train);

figure,plot(1:size(date,1),datenum(date));
