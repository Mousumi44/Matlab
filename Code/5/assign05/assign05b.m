% John David WAtts
% Lab05a.m
% October 9, 2019
%{
You can use trigonometry to find the height of a building. 
Suppose you measure the angle between the line of sight and the
horizontal line connecting the measuring point and the building.
You can calculate the height of the building with the following formulas:
tan(vector_of_angles)=h/d h=d*tan(vector_of_angles)
Assume that the distance to the building alone the ground is 120 meters
and the angle measured alone the line of sight is 30 degrees
plus/minus 3 degrees.
--Create a 15x1 matrix of random numbers bound by the 4-45 degrees.
--"find" the angles within the original angle range, 
27-33 (p.278)
a) compute the height of the building for given the distance and each acceptable angle
display a label and the table of angles and heights from the results of a).
b) get average angle in the 15x1 matrix
if average vector_of_angles not with range print message too small or too large
else compute and display average and height
%}

clc, clear all 
format bank

%*****CONSTANTS*******
MAX_RAND_ANGLE = 45;  % degrees **
MIN_RAND_ANGLE = 5;   % degrees **
MAX_ANGLE      = 33;  % degrees *
MIN_ANGLE      = 27;  % degrees *
DISTANCE       = 120; % meters

%*******INPUT*********
% create a 15 x 1 vector of angles within the broader given angle range
userInput = input('Enter the number of times to repeat the assign05a requirements: ');
for counter = 1:userInput
randNum = rand(15,1);
vector_of_angles = MIN_RAND_ANGLE +(MAX_RAND_ANGLE - MIN_RAND_ANGLE) * randNum;

% find the angles within the target angle range (p. 278)
element = find( vector_of_angles >= MIN_ANGLE & vector_of_angles <= MAX_ANGLE );

%*****COMPUTE*****
% a) compute the height of the building for given the distance and each acceptable angle
heightAll = DISTANCE .* tand( vector_of_angles(element) );

% b) get average angle in the 15x1 matrix
meanvector_of_angles = mean( vector_of_angles );
%meanvector_of_angles2 = abs(min(vector_of_angles)- max(vector_of_angles)./min(vector_of_angles);

% compute the height of the building using the average angle
heightMean = DISTANCE .* tand( meanvector_of_angles );

%*****OUTPUT*****
% a) display lable and table of angles within the original range and heights

disp(['For run # ',  num2str(counter)]);
if meanvector_of_angles < MIN_ANGLE && isempty(element)
    disp([num2str(meanvector_of_angles), ' degrees, average angle too small'])
    disp(' ')
    
elseif meanvector_of_angles > MAX_ANGLE && isempty(element)
    disp([num2str(meanvector_of_angles), ' degrees, average angle too big'])
    disp(' ')
    
elseif meanvector_of_angles < MIN_ANGLE && ~isempty(element)
    disp('         Angle         Height')
    disp('        Degrees        Meters')
    disp([vector_of_angles(element),heightAll])
    disp([num2str(meanvector_of_angles), ' degrees, average angle too small'])
    disp(' ')
    
elseif meanvector_of_angles > MAX_ANGLE && ~isempty(element)
    disp('         Angle         Height')
    disp('        Degrees        Meters')
    disp([vector_of_angles(element),heightAll])
    disp([num2str(meanvector_of_angles), ' degrees, average angle too big'])
    disp(' ')
    
else
    disp('         Angle         Height')
    disp('        Degrees        Meters')
    disp([vector_of_angles(element),heightAll])
    disp(['The building height is ', num2str(heightMean), ' meters for the average angle ', num2str(meanvector_of_angles), ' degrees.'])
    disp(' ')
end
end
