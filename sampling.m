clear all;
close all;
clc;
k=1;
x=[];
for f=-1.1:0.1:1.1
    x=cos(2*pi.*f.*(0:49));
    subplot(6,4,k);
    stem(x);
    k=k+1;
    title(['f=' num2str(f)]);
end