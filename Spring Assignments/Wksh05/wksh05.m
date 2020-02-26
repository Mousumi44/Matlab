% YOUR NAME
% wksh05.m
clc, clear all
% *** CONSTANTS ***
FILENAME = 'wksh05Data.txt';
NUM_ROWS = 3;
NUM_COLS = 4;
% *** INPUT ***
[ fileID, msg ] = fopen( FILENAME, 'r' );
% is file available?
if fileID <= 0
    disp( msg )
else
    % file available 
    % read data file and build matrix one number at a time
    for r = 1:NUM_ROWS
        for c = 1:NUM_COLS
            matrix05(r,c) = fscanf( fileID, '%f', 1 );
        end
    end
    % *** OUTPUT ***
    % output matrix, row averages, column averages, overall average
    fprintf( '%8.3f %8.3f %8.3f\n', matrix05 )
    disp( ['row average = ' num2str( mean( matrix05 ) )] )
    disp( ['col average = ' num2str( mean( matrix05' ) )] )
    disp( ['all average = ' num2str( mean( matrix05(:) ) )] )
    fclose( fileID );
end
