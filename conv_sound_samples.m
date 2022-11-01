clear all;
close all;
clc;
x1=0,x2=24000;%Setting limits for x(t)
h1=0,h2=24000;%Setting limits for h(t)
xi1=x1+h1;
xi2=x2+h2;
if xi1>xi2
  t=-ceil(xi1):ceil(xi1);
elseif xi1<xi2
  t=-ceil(xi2):ceil(xi2);
end
%Recording voice sample---------------------------------------------------------
r1 = audiorecorder(8000 ,8,1);
buff=input("To start recording press any key and record a sample of 3s");
disp('Start speaking.');
recordblocking(r1, 3);
disp('End of Recording.');
x = getaudiodata(r1);
%Getting the second sample------------------------------------------------------
h=audioread("audiocheck.net_sin_100Hz_-3dBFS_3s.wav");%sin wave of 100hz
h(end)= [];
%Sampling-----------------------------------------------------------------------
X=zeros(1,length(t));
H=zeros(1,length(t));
for i=1:x2
  X(i)=x(i);
  H(i)=h(i);
end
%Ploting both signals-----------------------------------------------------------
subplot(3,1,1);
plot(t,X,'r');
title("Voice Signal");
subplot(3,1,2);
plot(t,H,'g');
title("Sine wave of 100hz");
%Calculating convolution--------------------------------------------------------
Y=zeros(1,length(t));
for i=xi1:xi2
  H1=fliplr(H);%flipping
  H1=circshift(H1,[0,i]);%shifting
  a=H1.*X;%scaling
  Y(t==i)=sum(a);
end
%ploting Convolution of voice and sine waves------------------------------------
subplot(3,1,3);
plot(t,Y,'b');
title("Convolution");

%sounding both signals----------------------------------------------------------
disp("Playing back the voice signal")
sound(X(1:24000))
disp("Playing the 100hz sine wave")
sound(H(1:24000))
%Sounding the conv
disp("Playing the convolved signal");
sound(Y(48000:end));


