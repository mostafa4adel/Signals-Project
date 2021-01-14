%number a u(t+1) -u(t-3) means from -1 to 3

x=linspace(-1,3,7000);


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
yOf3T=FunctionTForQ1(x);
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
%first shift by 4
%second scale
%third reflect

subplot(2,2,4);
%shift
xShiftOf4=x-4;

%scale
yOf2t=FunctionTForQ1(x);
xShiftOf4=xShiftOf4/2;

%reflect
xShiftOf4=-xShiftOf4;


plot(xShiftOf4,yOf2t);
title('Q)d)')


















