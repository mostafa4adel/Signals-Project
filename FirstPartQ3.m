clear all;
clc;
close all;

t=linspace(0,pi,pi*1000); % taking the function from 0 to pi only 
x=exp(-t);

subplot(3,2,[1,2]);
plot(t,x);
title('X(t)');


clear t;



nneg=-10:-1;
npos=1:10;
xneg=(1./(pi*(1+nneg*j*2))).*(1-exp(-pi*(1+nneg*j*2)));
xpos=(1./(pi*(1+npos*j*2))).*(1-exp(-pi*(1+npos*2*j)));
x0=(1-exp(-pi))/pi;
n=[nneg 0 npos];
x=[xneg x0 xpos];
subplot(3,2,3);
stem(n/pi,abs(x));
title('amplitude spectrum')


subplot(3,2,4);
stem(n/pi,angle(x));
title("phase spectrum")
%%======================================================


nneg=-100:-1;  %increase or dec accuraccy
npos=1:100;    %increase or dec accuraccy
xneg=(1./(pi*(1+nneg*j*2))).*(1-exp(-pi*(1+nneg*j*2)));
xpos=(1./(pi*(1+npos*j*2))).*(1-exp(-pi*(1+npos*2*j)));


n=[nneg 0 npos];
x=[xneg x0 xpos];



k=0;
for t=0:.01:pi
k=k+1;
xapprox(k)=sum(x.*(exp(j*n*t*2)));
end

t=0:.01:pi;
subplot(3,2,[5,6]);
plot(t,xapprox);
title('X(t) approximated');


