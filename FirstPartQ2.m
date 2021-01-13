
clear all;
close all;
clc;
%%part a
fs=100;
t=linspace(-20,20,fs*40);
m=sinc(power(10,-3).*t).^2;
M=fftshift(fft(m));  %Fourier
Fvec=linspace(-100,100,fs*40)./fs;
figure; plot(Fvec,abs(M));
title("")




%%part b
r=m.*cos(2*pi*power(10,5)*t);
R=fftshift(fft(r)); %fourier
figure; plot(Fvec,abs(R))