function [queuesStats, otherStats] = getSimulationStat(days)
    queuesStats = mean(reshape(cell2mat(days(:, 2))', [], 4, size(days, 1)), 3)';
    otherStats = mean(cell2mat(days(:, 3)), 1);
end
