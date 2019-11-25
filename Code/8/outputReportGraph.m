function[] = outputReportGraph(date, rushing, passing, name, figureNum)

fprintf('\n2019 Season stats for %s \n', name)
fprintf('    Rushing       Passing\n')
fprintf('Date  Att Yds  per Att  Att Yds  per Att \n')
for index = 1: length(date(:,1))
	fprintf('%02.0f/%02.0f', date(index,1), date(index,2))
	fprintf('%3.0f %3.0f %5.2f   ', rushing(index,1), rushing(index,2), rushing(index,5))
	fprintf('%3.0f %3.0f %5.2f   \n', passing(index,1), passing(index,2), passing(index,5))
end

%draw charts
chartTitle = sprintf('2019 Season Stats for %s', name);
figure(figureNum)
bar([rushing(:,2), passing(:,2)])
title(chartTitle)
xlabel('Game')
ylabel('Yards')
end