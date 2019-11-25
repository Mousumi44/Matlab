clc, clear all

***** CONSTANT ******
DISTANCE = 120;
NUM_DEGREES = 10;
DEGREES_FILE = 'dataAssign06.txt'

***** INPUT ********
[fileID, msg] = fopen(DEGREES_FILE, 'r');

if fileID < 0
	fprintf('File open error\n')
else
	for d = 1: NUM_DEGREES
		theta(d) = fscanf(fileID, '%f', 1);
	end

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

end