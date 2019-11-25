clc, clear all

***** CONSTANT ******
DISTANCE = 120;
DEGREES_FILE = 'dataAssign06.txt'

***** INPUT ********
if ~exist(DEGREES_FILE, 'file')
	fprintf('File not found\n');
else
	theta = load(DEGREES_FILE)

*****COMPUTATION******
%compute height of the building for given distance and each angle
heightAll = DISTANCE .* tand(theta);

%get average angle of angles in vector
meanTheta = mean(theta);

%compute the height of the building using the average angle
heightMean = DISTANCE .* tand(meanTheta);

******OUTPUT***********
fprintf(' Angle     Height\n')
fprintf(' Degrees   Meters\n')
fprintf('%5.2f     %5.2f\n' , [theta; heightAll])

fprintf('\nThe height %5.2f meters for the average angle %5.2f degrees.\n' , heightMean, meanTheta)
fprintf('%.0f degrees were read from the data file.\n', length(theta))

end