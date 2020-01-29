clc, clear all
format bank
format loose


%****CONSTATNTS****
PRINCIPAL = 4000; %dollars

%****INPUT****
rates = linspace(4,5,4);; %interest per period
time = 4;    %years

%****COMPUTE****
simple_I = rates .* time .* PRINCIPAL ./ 100;
table = [rates', simple_I'];

%****OUTPUT****
disp("         Rate(%)    Interest($):")
disp(table)
