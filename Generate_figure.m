clc;close all;clear;
No=6;
GL=6;
n=137;
I = [7 8 13 18 21 ];%GL6

% No=2;
% GL=7;
% n=59;
% I = [7 8 13 21 26 ];%GL7

beginT=cell(0);
endT=cell(0);
for i1=1:n
    load(strcat('fault_location\',num2str(No),'\data_',num2str(i1),'.mat'));
    beginT=[beginT;date_str_begin];
    endT=[endT;date_str_end];
    fig=figure('name',strcat(date_str_begin,' to ',date_str_end));
    feature=data0(:,I);
    t=(date0-date0(1))*24;
    plotvariable
    for i = 1: length(I)
        subplot(length(I),1,i)
        plot(t,feature(:,i));
        title(ZCS{GL,I(i)})
    end
    saveas(fig,strcat('fault_location\',num2str(No),'\peepole_',num2str(i1),'.fig'));
    saveas(fig,strcat('fault_location\',num2str(No),'\peepole_',num2str(i1),'.jpg'),'jpeg');
    close(fig);
end
index=[1:length(endT)]';
T = table(index,beginT,endT);
writetable(T,strcat('fault_location\',num2str(No),'\FaultOrNot.csv'),'Delimiter',',');