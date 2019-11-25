clc, clear all
format compact

%*****CONSTANT**********
AU_STATS = 'AU_stats10.xls';
IN_SHEET = 'AU season';
OUT_SHEET = 'AU home games.hello';

%****INPUT*******
if ~exist(AU_STATS, 'file')
    disp('File not found')
else 
    [numbers,strings] = xlsread(AU_STATS, IN_SHEET);
    cellArray = createReportCellArray(numbers, strings);
    xlswrite(AU_STATS, cellArray, OUT_SHEET)
end