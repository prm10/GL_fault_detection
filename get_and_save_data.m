clc;clear all;close all;

date_str_begin=datestr([2012,03,11,00,00,00],'yyyy-mm-dd');
date_str_end=datestr( [2012,03,24,00,00,00],'yyyy-mm-dd');
label='悬料';
[date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
save(strcat('data_',label,'_',date_str_end,'.mat'),'date','data');

date_str_begin=datestr([2012,11,03,00,00,00],'yyyy-mm-dd');
date_str_end=datestr( [2012,11,16,00,00,00],'yyyy-mm-dd');
label='管道';
[date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
save(strcat('data_',label,'_',date_str_end,'.mat'),'date','data');

date_str_begin=datestr([2013,01,02,00,00,00],'yyyy-mm-dd');
date_str_end=datestr( [2013,01,15,00,00,00],'yyyy-mm-dd');
label='悬料';
[date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
save(strcat('data_',label,'_',date_str_end,'.mat'),'date','data');

date_str_begin=datestr([2013,02,01,00,00,00],'yyyy-mm-dd');
date_str_end=datestr( [2013,02,13,00,00,00],'yyyy-mm-dd');
label='管道';
[date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
save(strcat('data_',label,'_',date_str_end,'.mat'),'date','data');

date_str_begin=datestr([2013,02,15,00,00,00],'yyyy-mm-dd');
date_str_end=datestr( [2013,02,28,00,00,00],'yyyy-mm-dd');
label='炉凉';
[date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
save(strcat('data_',label,'_',date_str_end,'.mat'),'date','data');