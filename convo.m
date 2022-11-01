clear all;
close all;
clc;
x1=0,x2=20;
h1=0,h2=20;
xi1=x1+h1;
xi2=x2+h2;
if xi1>xi2
  t=-ceil(xi1):ceil(xi1);
elseif xi1<xi2
  t=-ceil(xi2):ceil(xi2);
end
x=t;
h=t;
X=zeros(1,length(t));
H=zeros(1,length(t));
H(t<=h2 & t>=h1)=h(t<=h2 & t>=h1);
X(t>=x1 & t<=x2)=x(t>=x1 & t<=h2);
subplot(4,1,1);
plot(t,X,'r');
title("X(t)");
subplot(4,1,2);
plot(t,H,'g');
title("H(t)");
Y=zeros(1,length(t));