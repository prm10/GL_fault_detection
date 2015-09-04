function [date,data]=get_data_from_sql_server(GL,date_str_begin,date_str_end)
% GL3
% 2013-01-27 00:00:08.000
% 2013-03-28 19:17:45.000

% formatOut = 'yyyy-mm-dd';
% date_str_begin=datestr([2013,02,15,00,00,00],formatOut);
% date_str_end=datestr( [2013,02,28,00,00,00],formatOut);
% save('date_info.mat','date_str_begin','date_str_end'); 

date_str1=date_str_begin;
date_str2=date_str_begin;
original_time=datenum(date_str1);
conn=database('matlab_sqlserver','sa','LiuGangData!419');
data=[];
date=[];

i0=0;
h=waitbar(0,'数据转换进度');
while(datenum(date_str1)<datenum(date_str_end))
    waitbar((datenum(date_str2)-original_time)/(datenum(date_str_end)-original_time),h,'数据转换进度');
    date_str2=datestr((datenum(date_str1)+1-1/3600/24),'yyyy-mm-dd HH:MM:SS');
    sql_cmd=strcat('SELECT * FROM ',GL);
    sql_cmd=strcat(sql_cmd,' Where [时间] Between ''',date_str1,''' And ''',date_str2,''' Order By [时间]');
    [date1,data1]=sql_cmd_exec(conn,sql_cmd);
    i0=i0+1;
    data=[data;data1];
    date=[date;date1];
    date_str1=datestr((datenum(date_str1)+1),'yyyy-mm-dd');
end
close(conn);
close(h);
end

function [date,data]=sql_cmd_exec(conn,sql_cmd)
curs=exec(conn,sql_cmd);
curs=fetch(curs);
Data=curs.Data;%把读取到的数据用变量Data保存.
data=cell2mat(Data(:,2:end));
date=cell2mat(Data(:,1));
close(curs);
end
