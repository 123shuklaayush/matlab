clear all;
close all;
clc;
recorder = audiorecorder(8000 ,8,1);
disp('Start speaking.');
recordblocking(recorder, 5);
disp('End of Recording.');
data = getaudiodata(recorder)
plot(data)
