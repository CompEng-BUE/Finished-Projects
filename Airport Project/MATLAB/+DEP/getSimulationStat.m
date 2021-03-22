function [queuesStats, otherStats] = getSimulationStat(days)
    nCompanies = size(days{1,1}, 1);
    x = reshape(permute(cell2mat(days(:, 2)), [2,1,3]), [], 4, size(days, 1), nCompanies);
    queuesStats = permute(reshape(mean(x, 3), [], 4, nCompanies), [2,1,3]);
    
    otherStats = mean(cell2mat(days(:, 3)), 1);
end
