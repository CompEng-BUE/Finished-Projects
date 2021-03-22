function [queuesStats, otherStats] = getDayStat(companies)
    queuesStats = permute(reshape(cell2mat(companies(:, 3))', [], 4, size(companies, 1)), [2,1,3]);
    otherStats = reshape(cell2mat(companies(:, 4))', 1, [], size(companies, 1));
end
