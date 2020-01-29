clc, clear all
format bank
format loose


%****CONSTATNTS****
PRINCIPAL = 4000; %dollars

%****INPUT****
lowRate = input('Enter the low value for the rate range: ');
highRate = input('Enter the high value for the rate range: ');
numRate = input('Enter the increment between rates: ');
time = input('Enter number of years: ');

%****create rate vectors*****
rates = lowRate:numRate:highRate; %interest per period

%****COMPUTE****
%compute simple interest
simple_I = rates .* time .* PRINCIPAL ./ 100;

%create a table with rate and simple interest
table = [rates', simple_I'];

%get the average rate and interest
aveTable =[mean(rates), mean(simple_I)];

%****OUTPUT****
%display simple interest with label
disp("         Rate(%)    Interest($):")
disp(table)

%display average rate and interest with label
disp("Average:  Rate(%)    Interest($):")
disp(aveTable)