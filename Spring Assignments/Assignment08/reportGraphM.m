﻿% Mousumi
% April 3, 2020
% reportGraph.m used with assign08.m
function [] = reportGraphM( date, scores, stats )
    % print AU softball report and graph scores
    % get size of stats
    [ nGames, nStats ] = size( stats );
    % compute game batting average
    aveBat = stats( :,3 ) ./ stats( :,1 );
    % print season report: date, scores, batting average
    % print title and headers
    fprintf( '2020 AU Softball Batting Stats as of %02d/%02d\n', date(nGames,:) )
    fprintf( 'Date Score W/L AB Runs Hits HRuns Ave\n' )
    for g = 1:nGames
    fprintf( '%02d/%02d %02d-%02d ', date(g,:), scores(g,:) )
    if scores(g,1) > scores(g,2)
    fprintf( 'W' )
    else
    fprintf( 'L' )
    end
    fprintf( ' %2d %2d %2d %2d %5.3f\n', stats( g,: ), aveBat(g) )
    end
    % print average scores and stats; over all batting average
    fprintf('Ave: %04.1f-%04.1f %4.1f %4.1f %4.1f %4.1f %5.3f\n',...
    mean(scores), mean(stats), sum(stats(:,3))./sum(stats(:,1)) )
    % plot Auburn and opponents scores using stacked bar graph
    graphScores( scores )
end
function [] = graphScores( scores )
    % plot Auburn and opponents scores using stacked bar graph
    bar( scores, 'stacked' )
    title( '2020 AU Softball Scores' )
    xlabel( 'Game number' )
    ylabel( 'Scores' )
    legend( 'Auburn','Opponent' )
end
