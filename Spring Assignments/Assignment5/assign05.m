clc, clear all
format bank
format loose

%******CONSTANT********
FILENAME = 'dragCoef05.txt';
DENSITY = 1.225; %kg/m^3
FORCE = 350; %N
VELOCITY = 90/3.6; %km/h

%does file exist?
if ~exist(FILENAME, 'file')
    disp('file not available');
else
    % file exist coninue
    %******INPUT********
    % read year and drag coefficient from file
    yearDrag = load(FILENAME);
    %select a car from menu
    carIndex = menu('Choose a car','BMW 7','Toyota Tacoma','Tesla 3','Audi A6','Jeep Wrangler','Toyota Corolla');
    
    %******COMPUTE********
    % compute the frontal area for selected and all cars
    frontalArea = (2*FORCE) ./(yearDrag(carIndex,2)*DENSITY*VELOCITY^2);
    allArea = (2*FORCE) ./(yearDrag(:,2)*DENSITY*VELOCITY^2);
    
    % add frontal area as third column of matrix
    yearDrag(:,3) = allArea';
    
    % sort matrix by frontal area column ascending order
    sortMatrix = sortrows(yearDrag,3);
    
    %*******OUTPUT*******
    % display the frontal area of chosen car
    disp(['Year of car#' num2str(carIndex) ':     ' num2str(yearDrag(carIndex,1)) ]);
    disp(['Frontal Area of car#' num2str(carIndex) ':     ' num2str(frontalArea) ]);
    disp(' ');
    
    % display table of drag coefficients and frontal areas
    disp('   All Cars')
    disp('       Year             Drag         Frontal')
    disp('                        Coef         Area(m^2)')
    disp(sortMatrix);
    
    %print table again using fprintf()
    fprintf('\n   All Cars\n')
    fprintf('        Year           Drag        Frontal\n')
    fprintf('                       Coef        Area(m^2)\n')
    fprintf('        %4.0f           %4.2f        %6.4f\n',sortMatrix')
end

%**************