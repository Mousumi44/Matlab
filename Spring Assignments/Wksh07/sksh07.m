clc, clear all
format bank
    
TEXTFILE = 'week07File.txt';

[gr1,gr2,gr3,gr4] = textread(TEXTFILE, '%f%f%f%f');
% resulting output  99  90 100 100
 
fprintf('%3.0f %3.0f %3.0f %3.0f\n', gr1(1),gr2(1),gr3(1),gr4(1) )

[gr(:,1),gr(:,2)] = textread(TEXTFILE, '%f%*f%f%*f');
% resulting output  99  100
 
fprintf(' %3.0f %3.0f \n\n', gr(1,1),gr(1,2) )

disp(gr)


%Second Part

TEXTFILE = 'week07sFile.txt'; 

[gr(:,1),gr(:,2)] = textread(TEXTFILE, '%*s%f%*f%f%*f');

disp("\n")
disp(gr)
