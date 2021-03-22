function [queuesStats, otherStats] = getCompanyStat(planes)
    queuesStats = mean(reshape(cell2mat(planes(:, 4))', [], 2, 6), 3)';
    otherStats = mean(cell2mat(planes(:, 5)), 1);
end
