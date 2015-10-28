clc;clear all;close all;

%% from 2012-07-20 to 2013-03-20
n=8;
date_str_begin=datestr([2012,07,20,00,00,00],'yyyy-mm-dd');
for i1=1:n
    date_str_end=datestr(datenum(date_str_begin)+30,'yyyy-mm-dd');
    [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
    save(strcat('K:\GL_data\3\','data_',num2str(i1),'.mat'),'date0','data0');
    fprintf('get data from %s to %s \n',date_str_begin,date_str_end);
    date_str_begin=date_str_end;
end
%% fault classification
% date_str_begin=datestr([2012,03,11,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2012,03,24,00,00,00],'yyyy-mm-dd');
% label='悬料';
% [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save(strcat('data_',label,'_',date_str_end,'.mat'),'date0','data0');
% 
% date_str_begin=datestr([2012,11,03,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2012,11,16,00,00,00],'yyyy-mm-dd');
% label='管道';
% [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save(strcat('data_',label,'_',date_str_end,'.mat'),'date0','data0');
% 
% date_str_begin=datestr([2013,01,02,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,01,15,00,00,00],'yyyy-mm-dd');
% label='悬料';
% [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save(strcat('data_',label,'_',date_str_end,'.mat'),'date0','data0');
% 
% date_str_begin=datestr([2013,02,01,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,02,13,00,00,00],'yyyy-mm-dd');
% label='管道';
% [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save(strcat('data_',label,'_',date_str_end,'.mat'),'date0','data0');
% 
% date_str_begin=datestr([2013,02,15,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,02,28,00,00,00],'yyyy-mm-dd');
% label='炉凉';
% [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save(strcat('data_',label,'_',date_str_end,'.mat'),'date0','data0');
% 
% date_str_begin=datestr([2012,07,01,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2012,10,01,00,00,00],'yyyy-mm-dd');
% label='正常';
% [date0,data0]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save(strcat('data_',label,'_',date_str_end,'.mat'),'date0','data0');