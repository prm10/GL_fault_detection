clc;clear all;close all;
date_str_begin=datestr([2013,02,15,00,00,00],'yyyy-mm-dd');
date_str_end=datestr( [2013,02,28,00,00,00],'yyyy-mm-dd');
[date,data]=get_data_from_sql_server('[GL3].[dbo].[ZCS3]',date_str_begin,date_str_end);