function[] = printReport(theta, heightAll, heightMean, meanTheta)

fprintf('Angle Height\n')
fprintf('Radians Meters\n')
fprintf('%6.4f  %5.2f\n', [theta';heightAll'])

fprintf('\nThe height %5.2f meters for the average angle %6.4f radians.\n', heightMean, meanTheta)

fprintf('%0.f radians were read from the data file.\n', length(theta))
plotData(theta, heightAll)
end

function[] = plotData(theta, heightAll)

measureNum = 1:length(theta);
[hAx, hLine1, hLine2] = plotyy(measureNum, theta, measureNum, heightAll);
title('Angles vs Heights')
xlabel('Measurement number')

hLine1.LineStyle = '--';
hLine2.LineStyle = ':';
ylabel1(hAx(1), 'Angles (radians)')
ylablel1(hAx(2), 'Heights (meters)')
end
