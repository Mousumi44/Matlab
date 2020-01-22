clc, clear all
format bank
format loose


%****CONSTATNTS****
PRINCIPAL = 4000; %dollars

%****INPUT****
rate = 4.75; %interest per period
time = 4;    %years

%****COMPUTE****
simple_I = rate*time*PRINCIPAL/100;

%****OUTPUT****
disp("Simple interest ($):")
disp(simple_I)