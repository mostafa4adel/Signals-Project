%number a u(t+1) -u(t-3) means from -1 to 3
x=linspace(-1,3,5000);
yOfT=exp(-abs(x)/5);

%plot(x,yOfT);
%remove comment to activate plot