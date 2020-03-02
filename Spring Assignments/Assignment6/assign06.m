clc, clear all
format bank
format loose

%******CONSTANT********
FILENAME = 'dragCoef06.txt';
DENSITY = 1.225; %kg/m^3
FORCE = 350; %N
VELOCITY = 90/3.6; %km/h

%does file exist?
[fileID, msg] = fopen(FILENAME,'r');
if fileID <= 0
    fprintf('file not available');
else
    % file exist coninue
    %******INPUT********
    % read number of cars and columns
    numCars = fscanf(fileID, '%f', 1);
    numCols = fscanf(fileID, '%f', 1);
    
    %read year and drag coefficient from file
    for car=1:numCars
        for col=1:numCols
            yearDrag(car, col)= fscanf(fileID, '%f', 1);
        end
    end
    
    %******COMPUTE********
    % compute the frontal area for selected and all car
    allArea = (2*FORCE) ./(yearDrag(:,2)*DENSITY*VELOCITY^2);
    
    % add frontal area as third column of matrix
    yearDrag(:,3) = allArea';
    
    % sort matrix by frontal area column ascending order
    sortMatrix = sortrows(yearDrag,1);
    
    %get average frontal area
    aveArea = mean(sortMatrix(:,3));
    
    %*******OUTPUT*******
    
    %print table again using fprintf()
    fprintf('\n   All Cars\n')
    fprintf('        Year           Drag        Frontal\n')
    fprintf('                       Coef        Area(m^2)\n')
    for car=1:numCars
        fprintf('        %4.0f           %4.2f        %6.4f\n',sortMatrix(car,:));
        if sortMatrix(car,3)>aveArea
            fprintf('*\n');
        else
            fprintf('\n');
        end
    end
    fprintf('* Frontal area above area \n');
    fclose(fileID);
end
