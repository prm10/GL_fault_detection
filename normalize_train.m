function [value,threshhold]=normalize_train(x,n)
% x=[1:1000]';
% n=10;
boundary=3;
n=2*n+1;
delta=2*boundary/n;
baffle=-boundary:delta:boundary;
value=[-boundary-delta;(baffle(1:end-1)+baffle(2:end))'/2;boundary+delta];
p=1/sqrt(2*pi)*exp(-1/2*value'.^2);
p=p/sum(p);
num=(p*length(x))*triu(ones(length(p)),0);
x1=sort(x);
threshhold=x1(min(ceil(num(1:end-1)),length(x)*ones(1,length(num)-1)));
end