clc, clear all

% ***** CONSTANT *****
FILENAME = 'dragCoef07.txt';
DENSITY = 1.225; % kg/m3,density of air at sea level
FORCE = 350; % Newtons (N), force of the drag
VELOCITY = 90/3.6; % or 25 m/s, velocity of object relative to the fluid
% autonomous function to compute frontal area
getArea = @(coef) (2*FORCE) ./ ( coef * DENSITY * VELOCITY ^ 2 );
% ***** INPUT *****
% open data file
[ fileID, msg ] = fopen( FILENAME, 'r' );
% does file exist?
if fileID <= 0
    fprintf( 'File not available\n' )
else
    % file exist continue
    % read year and drag coefficient from file
    car = 0;
    while ~feof( fileID )
    car = car + 1;
    yearDrag( car, 1 ) = fscanf( fileID, '%f', 1 ); % year
    yearDrag( car, 2 ) = fscanf( fileID, '%f', 1 ); % drag coefficient
    end
    % ***** COMPUTE *****
    % compute the frontal area of all cars
    allArea = getArea( yearDrag(:,2) );
    % add frontal area as third column of matrix
    yearDrag(:,3) = allArea';
    % sort matrix by year column ascending order
    sortMatrix = sortrows( yearDrag, 1 );
    % get average frontal area
    aveArea = mean( sortMatrix(:,3) );
    % ***** OUTPUT *****
    % print table again using fprintf()
    printReport( sortMatrix, aveArea )
    fclose( fileID );
end