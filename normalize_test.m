function y=normalize_test(x,value,threshhold)
% x=[1:1000]';
% threshhold=[1;32;43;65;765];
% value=[1;2;3;4;5;6];
y=zeros(length(x),1);
a=x<=threshhold(1);
y(a)=value(1);
for i1=1:length(threshhold)-1
    a=(x>threshhold(i1))&(x<=threshhold(i1+1));
    y(a)=value(i1+1);
end
a=x>threshhold(end);
y(a)=value(end);
end