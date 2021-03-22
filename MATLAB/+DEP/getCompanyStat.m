function [queuesStats, otherStats] = getCompanyStat(planes)
    queuesStats = mean(reshape(cell2mat(planes(:, 5))', [], 4, 6), 3)';
    otherStats = mean(cell2mat(planes(:, 6)), 1);
end
