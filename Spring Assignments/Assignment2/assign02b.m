clc, clear all
format bank
format loose


%****CONSTATNTS****
PRINCIPAL = 4000; %dollars

%****INPUT****
rates = [4.00, 4.33, 4.67, 5.00]; %interest per period
time = 4;    %years

%****COMPUTE****
simple_I = rates .* time .* PRINCIPAL ./ 100;
table = [rates', simple_I'];

%****OUTPUT****
disp("         Rate(%)    Interest($):")
disp(table)