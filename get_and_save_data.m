clc;clear;close all;
%% new No6. GL6 from 2013-07-04 to 2015-12-10
% No=6;
% GL=6;
% date_str_begin=datestr([2013,07,04,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr([2014,12,10,00,00,00],'yyyy-mm-dd');
% [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
% save(strcat('F:\GL_data\',num2str(No),'\data2013.mat'),'date0','data0');
% fprintf('get data from %s to %s \n',date_str_begin,date_str_end);

% No=6;
% GL=6;
% date_str_begin=datestr([2014,12,10,00,00,00],'yyyy-mm-dd');
% % date_str_begin=datestr([2015,09,21,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr([2015,12,01,00,00,00],'yyyy-mm-dd');
% [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
% save(strcat('F:\GL_data\',num2str(No),'\data2014.mat'),'date0','data0');
% fprintf('get data from %s to %s \n',date_str_begin,date_str_end);

%% new No2. GL7 from 2013-07-04 to 2015-12-10
No=2;
GL=7;
date_str_begin=datestr([2014,01,25,00,00,00],'yyyy-mm-dd');
date_str_end=datestr([2015,01,01,00,00,00],'yyyy-mm-dd');
[date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
save(strcat('F:\GL_data\',num2str(No),'\data2014.mat'),'date0','data0');
fprintf('get data from %s to %s \n',date_str_begin,date_str_end);

No=2;
GL=7;
date_str_begin=datestr([2015,01,01,00,00,00],'yyyy-mm-dd');
date_str_end=datestr([2015,12,08,00,00,00],'yyyy-mm-dd');
[date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
save(strcat('F:\GL_data\',num2str(No),'\data2015.mat'),'date0','data0');
fprintf('get data from %s to %s \n',date_str_begin,date_str_end);


% %% No2. GL7 from 2013-12-01 to 2014-02-01
% No=2;
% GL=7;
% date_str_begin=datestr([2013,12,01,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr([2014,02,01,00,00,00],'yyyy-mm-dd');
% [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
% save(strcat('K:\GL_data\',num2str(No),'\data.mat'),'date0','data0');
% fprintf('get data from %s to %s \n',date_str_begin,date_str_end);
% %% No3. GL1 from 2012-10-20 to 2013-03-20
% No=3;
% GL=1;
% date_str_begin=datestr([2012,3,20,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr([2013,03,20,00,00,00],'yyyy-mm-dd');
% [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
% save(strcat('K:\GL_data\',num2str(No),'\data.mat'),'date0','data0');
% fprintf('get data from %s to %s \n',date_str_begin,date_str_end);
% %% No5. GL1 from 2012-10-20 to 2013-03-20
% No=5;
% GL=5;
% date_str_begin=datestr([2012,05,01,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr([2013,03,20,00,00,00],'yyyy-mm-dd');
% [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
% save(strcat('K:\GL_data\',num2str(No),'\data.mat'),'date0','data0');
% fprintf('get data from %s to %s \n',date_str_begin,date_str_end);

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
% date_str_begin=datestr([2013,01,10,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,01,16,00,00,00],'yyyy-mm-dd');
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