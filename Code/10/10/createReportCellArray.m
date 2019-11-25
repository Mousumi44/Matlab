function outCell = createReportCellArray(stats, labels)

printReport(stats, labels)
outCell = createCellArray(stats, labels);
end

function [] = printReport(stats, labels)

[nGames, nCols] = size(stats);
fprintf('%s Summary\n', labels{1,1})
wins = find(stats(:,1) > stats(:,2));
fprintf('Overall season record: %d-%d \n', length(wins), nGames-length(wins))

numSecGames = 0;
numSecWins = 0;
for index = 1:nGames
    if stats(index,1) > stats(index,2)
        if ~isempty(strfind(labels{index+2,2}, '*'))
            numSecWins = numSecWins + 1;
        end
        numSecGames = numSecGames + 1;
    end
end

fprintf('SEC season record: %d-%d \n', numSecWins, numSecGames-numSecWins)
[maxSpread, gamesNum] = max(abs(stats(:,1)-stats(:,2)));
fprintf('Largest point spread was %d on %s agaisnt %s. \n',...
    maxSpread, labels{gamesNum+2,1}, labels{gamesNum+2,3}(4:end))
end 

function outCell = createCellArray(stats, labels)
[nGames, nCols] = size(stats); 
hours = stats(:,3) + stats(:,4)/60;
aveAttend = mean(stats(:,5));

outCell{1,1} = sprintf('%s Home Games as of %s \n', labels{1,1}, labels{nGames+2});
outCell{2,1} = labels{2,1};
outCell{2,2} = labels{2,3};
outCell{2,3} = labels{2,4};
outCell{2,4} = labels{2,5};
outCell{2,5} = 'W-L';
outCell{2,6} = 'Hours';
outCell{2,7} = labels{2,8};

cellRow = 3;
for index = 1:nGames
    if strfind(labels{index+2,3}, 'vs')
        outCell{cellRow,1} = labels{index+2,1};
        outCell{cellRow,2} = labels{index+2,3};
        outCell{cellRow,3} = stats(index,1);
        outCell{cellRow,4} = stats(index,2);
        if stats(index,1) > stats(index,2)
            outCell{cellRow,5} = 'W';
        else
            outCell{cellRow,5} = 'L';
        end
        
        outCell{cellRow,6} = hours(index);
        outCell{cellRow, 7} = stats(index,5);
        if stats(index,5) > aveAttend
            outCell{cellRow,8} = '*';
        end
        cellRow = cellRow + 1;
    end
end

outCell{cellRow,1} = 'Average Attendance:';
outCell{cellRow,7} = aveAttend;
end 