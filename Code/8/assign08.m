clc, clear all
format compact

AU_STATS = 'AU_stats08.txt'
OPP_STATS = 'opp_stats08.txt'

%****INPUT*******

if ~exist(AU_STATS, 'file') || ~exist(OPP_STATS, 'file')
	disp('One or both files not available')
else
	%read auburn and opponent: date, rushing, passing
	[auDate(:,1), auDate(:,2), 
	 auRush(:,1), auRush(:,2), auRush(:,3), auRush(:,4),
	 auPass(:,1), auPass(:,2), auPass(:,3), auPass(:,4)]
	= textread('AU_STATS', '%f%f %f%f%f%f %f%f%f%f');

	[oppDate(:,1), oppDate(:,2), 
	 oppRush(:,1), oppRush(:,2), oppRush(:,3), oppRush(:,4),
	 oppPass(:,1), oppPass(:,2), oppPass(:,3), oppPass(:,4)]
	= textread('OPP_STATS', '%f%f %f%f%f%f %f%f%f%f');


%****COMPUTE*********
%compute auburn and opponent rushing and passing yards per attempt
%per each game

auRush(:,5) = auRush(:,2) ./ auRush(:,1);
auPass(:,5) = auPass(:,2) ./ auPass(:,1);
oppRush(:,5) = oppRush(:,2) ./ oppRush(:,1);
oppPass(:,5) = oppPass(:,2) ./ oppPass(:,1);

%****OUTPUT*******
outputReportGraph(auDate, auRush, auPass, 'Auburn', 1)
outputReportGraph(oppDate, oppRush, oppPass, 'Opponents', 2)




