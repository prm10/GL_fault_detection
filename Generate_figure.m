clc;clear;close all;
No=2;
GL=7;

% sql_cmd='select dateStr,num from ( select dateStr,count(*) as num from ( SELECT CONVERT(varchar(100), [时间], 23) as dateStr FROM [GL7].[dbo].[ZCS7] where (热风压力<0.34 or 冷风流量<20 or 顶温东北>350 or 富氧流量<5000 ) and 时间>''2014-01-25'' ) A group by dateStr ) B where num>100 order by dateStr'; 
% sql_cmd='';

% conn=database('gl','PRM14-LENOVO-PC\PRM','');
% curs=exec(conn,sql_cmd);
% curs=fetch(curs);
% Data=curs.Data;
% close(curs);
% close(conn);
% save('doubtfulDays.mat','Data');

load('doubtfulDays.mat');
% days=Data(:,1);
days=days(:,1);
i1=50;
i3=0;
while i1<length(days)%当前待处理的index
    i2=i1;%最后一个连续日期的index
    while((i2+1<length(days))&&(datenum(days(i2+1))-datenum(days(i2))<1.5))
        i2=i2+1;
    end
    date_str_begin=days{i1};
    date_str_end=datestr(datenum(days{i2})+1,'yyyy-mm-dd');
    [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
    index = [7 8 13 18 21 ];
    if i3>20 || size(date0,1)<2
        break;
    end
    h=figure;
    plot(date0,data0(:,index));
    title(strcat('from  ',date_str_begin,' to ',date_str_end));
    
    i1=i2+1; 
    i3=i3+1;
end