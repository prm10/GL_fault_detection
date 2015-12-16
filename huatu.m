clc;close all;clear;
No=6;
GL=6;
n=137;
I = [7 8 13 18 21 ];%GL6

i1=137;
delta_t=1*24*360;
range=(2:360*24)+delta_t;

load(strcat('fault_location\',num2str(No),'\data_',num2str(i1),'.mat'));
% beginT=[beginT;date_str_begin];
% endT=[endT;date_str_end];
% fig=figure('name',strcat(date_str_begin,' to ',date_str_end));
feature=data0(:,I);

t=(date0-date0(1))*24-delta_t/360;

plotvariable

figure;
i=1;
subplot(211);
plot(t(range,:),feature(range,i));
title(ZCS{GL,I(i)});

i=2;
subplot(212);
plot(t(range,:),feature(range,i));
title(ZCS{GL,I(i)});

figure;
i=3;
subplot(311);
plot(t(range,:),feature(range,i));
title(ZCS{GL,I(i)});
i=4;
subplot(312);
plot(t(range,:),feature(range,i));
title(ZCS{GL,I(i)});
i=5;
subplot(313);
plot(t(range,:),feature(range,i));
title(ZCS{GL,I(i)});


% figure;
% plot(t(range,:),feature(range,:));
% legend(ZCS{GL,I})