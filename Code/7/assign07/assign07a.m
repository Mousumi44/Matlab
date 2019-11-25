clc, clear all

%*** CONSTANTS *******
DISTANCE = 120;
RADIAN_FILE = 'dataAssign07.txt';

%*** INPUT *******
if ~exist(RADIAN_FILE, 'file')
	fprint('File not found');
else
	theta = load(RADIAN_FILE);

%*** COMPUTATION*******
heightAll = DISTANCE .* tan(theta);
meanTheta = mean(theta);
heightMean = DISTANCE .* tan(theta);

%*** OUTPUT *****

fprintf('Angle Height\n');
fprintf('Radians Meters\n');
fprintf('%6.4f.  %5.2f\n, [theta'; heightAll');

fprintf('\nThe height %5.2f meters for the average angle %6.4f radians.\n', heightMean, meanTheta);
fprintf('%.0f radians were read from the data file.\n', length(theta));

end


