clc, clear all

%*****CONSTANT*******
DISTANCE = 120;
RADIAN_FILE = 'dataAssign07.txt';
getHeight = @(radians) DISTANCE .* tan(radians);

%****INPUT******
if ~exist(RADIAN_FILE, 'file') 
	fprintf('File not found')
else
	theta = load(RADIAN_FILE);

%****COMPUTATON******
heightAll = getHeight(theta);
meanTheta = mean(theta);
heightMean = getHeight(meanTheta);

%****OUTPUT******

printReport(theta, heightAll,heightMean, meanTheta)

end