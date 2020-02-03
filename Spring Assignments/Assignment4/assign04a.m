clc, clear all
format bank
format loose

%****INPUT****
lowRate = input('Enter the low value for the rate range: ');
highRate = input('Enter the high value for the rate range: ');
rate = input(['Enter rate of interest ' num2str(lowRate) '-'  num2str(highRate) '% inclusive: ' ]);

%if rate not within the rate range, display message and end execution
if rate<lowRate || rate> highRate
    disp('Rate is out of acceptable range');
else
    %get principal and time
    principal = input('Enter amount of loan: ');
    years = input('Enter number of years: ');
    
    %compute simple interest
    simple_I = (rate .* years .* principal) ./ 100;
    
    %output
    disp(' ');
    disp('Loan Summary:')
    disp(['Principal: $' num2str(principal)]);
    disp(['Interest rate: ' num2str(rate) '%']);
    disp(['Time: ' num2str(years) ' years']);
    disp(['Simple interest: $' num2str(simple_I)]);   
end