﻿% assign08.m
% April 3, 2020
% read AU softball stats and print report
clc, clear all
%***** CONSTANT *****
SB_STATS = 'AU_SB_2020_08.txt';
%***** INPUT *****
% is file available?
if ~exist( SB_STATS, 'file' )
disp( 'File not available' )
else
% file available
% read file directly into a column of dates and scores matrix
[ dates(:,1),dates(:,2), scores(:,1),scores(:,2),...
stats(:,1), stats(:,2),stats(:,3),stats(:,4) ] =...
textread( SB_STATS, '%f%f%*s%*s%f%f%f%f%f%f' );
%***** OUTPUT *****
% print season report and scores
reportGraphM( dates, scores, stats );
end % end file available
