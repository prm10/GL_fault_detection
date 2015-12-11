% 
clear
close all
conn=database('gl','PRM14-LENOVO-PC\PRM','');
sqlquery='SELECT * FROM[GL7].[dbo].[ZCS7] Where [时间] Between ''2014-05-11'' And ''2014-05-11 23:59:59'' Order By [时间]';
% sqlquery='select * from GL6.dbo.ZCS6 where 时间 between ''2014/09/29  '' AND ''2014/10/08 ''';
curs = exec(conn,sqlquery);
curs = fetch(curs);
data=curs.Data;
feature_org=cell2mat(data(:,2:end));
% I = [7 8 13 21 26 ];
I = [7 8 13 18 21 ];
feature=feature_org(:,I);
plotvariable
for i = 1: length(I)
    subplot(length(I),1,i)
    plot(feature(:,i));
    title(ZCS{6,I(i)})
end