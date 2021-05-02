close all
clear all
clc

%% Input values
freq = 2000;        % signal frequency
duration1 = 0.03;   % buzz time
duration2 = 0.5;    % silence time
amp1 = 2;           % loundness
num = 3;           % number of pulses
%%

i = 0;
s = [];
fs = 20500;
amp2 = 0;

for  i = 1:num
    values=0:1/fs:duration1;
    a=amp1*sin(2*pi* freq*values);
    
    values=0:1/fs:duration2;
    b=amp2*sin(2*pi* freq*values);
    
    s = [s a b];
end

sound(s)