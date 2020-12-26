clear all;
close all;

t=linspace(0,pi,pi*1000); % taking the function from 0 to pi only 
x=exp(-t);
figure (1)
hold on
plot(t,x);
clear t;



nneg=-10:-1;
npos=1:10;
xneg=(1./(pi*(1+pi*nneg*j*2))).*(1-exp(-pi*(1+nneg*pi*j*2)));
xpos=(1./(pi*(1+pi*npos*j*2))).*(1-exp(-pi*(1+npos*2*pi*j)));
x0=(1-exp(-4))/4;
n=[nneg 0 npos];
x=[xneg x0 xpos];
figure (2)
stem(n,abs(x));
figure (3)
stem(n,angle(x));

%%======================================================


nneg=-100:-1;  %increase or dec accuraccy
npos=1:100;    %increase or dec accuraccy
xneg=(1./(pi*(1+pi*nneg*j*2))).*(1-exp(-pi*(1+nneg*pi*j*2)));
xpos=(1./(pi*(1+pi*npos*j*2))).*(1-exp(-pi*(1+npos*2*pi*j)));


n=[nneg 0 npos];
x=[xneg x0 xpos];



k=0;
for t=0:.01:4
k=k+1;
xapprox(k)=sum(x.*(exp(j*n*t*2)));
end

t=0:.01:4;
figure (1)
plot(t,xapprox);



