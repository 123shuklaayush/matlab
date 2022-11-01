clc;
clear all;
close all;
t =-50:0.001:50;
u(t>=0)=1;
u(t<0)=0;

a=sin(t)
d=6*u;
plot(d,t+2);
