% printReport.m used by assign07.m
function [] = printReport( carMatrix, aveArea )
% % print report and draw graph
% print rtable
fprintf( ' All Cars\n' )
fprintf( 'Year Drag Frontal\n' )
fprintf( ' Coef Area(m^2)\n' )
for car = 1:length(carMatrix(:,1) )
    fprintf( '%4.0f %4.2f %6.4f', carMatrix(car,:) )
    if carMatrix(car,3) > aveArea
        fprintf( ' *\n' )
    else
        fprintf( '\n' )
    end
end
fprintf( '* Frontal area above area \n' )
% draw a plot of the years and drag coef
plotData( carMatrix( :,1 ), carMatrix( :,2 ) )
end

function [] = plotData( years, dragCoef )
% draw a plot of the years and drag coef
numCars = 1:length( years );
[hAx,hLine1,hLine2] = plotyy( numCars, years, numCars, dragCoef );
title( 'Years .vs Drag Coef' )
xlabel( 'Car number' )
hLine1.LineStyle = '--';
hLine2.LineStyle = ':';
ylabel(hAx(1),'Year') % left y-axis
ylabel(hAx(2),'Drag Coef') % right y-axis
end