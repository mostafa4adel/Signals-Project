%number a u(t+1) -u(t-3) means from -1 to 3

x=linspace(-1,3,5000);


%5000 point 1000 for each point  
%for ex from -1 to 0 there is 1000 point to make function look smoother

yOfT=FunctionTForQ1(x);

subplot(2,2,1);
plot(x,yOfT);
title('Q)a)');



%==========================================================================
%number b compress the function by 3
subplot(2,2,2);
x3=x/3;
yOf3T=FunctionTForQ1(x3);
plot(x3,yOfT);
title('Q)b)');

%==========================================================================
%number c shift the signal by 2 in advance

subplot(2,2,3);
yOfShift2=FunctionTForQ1(x);
xShiftOf2=x-2;
plot(xShiftOf2,yOfShift2);
title('Q)c)')

%==========================================================================
%number d 

