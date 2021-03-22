function [queuesStats, otherStats] = getPlaneStat(passengersTiming, config)
    nQueues_counter = config(11:13);
    nQueues_security = config(14);
    
    stats_counter = zeros(4, sum(nQueues_counter));
    x = 1;
    for i = 1:3
        for j = 1:nQueues_counter(i)
            indices = (passengersTiming(:, 1) == i) & (passengersTiming(:, 2) == j);
            stats_counter(:, x) = GENERAL.getQueueStat(passengersTiming(indices, 3), passengersTiming(indices, 4), passengersTiming(indices, 5))';
            x = x + 1;
        end
    end
    
    stats_security = zeros(4, nQueues_security);
    for j = 1:nQueues_security
        indices = (passengersTiming(:, 6) == j);
        stats_security(:, j) = GENERAL.getQueueStat(passengersTiming(indices, 7), passengersTiming(indices, 8), passengersTiming(indices, 9))';
    end
    
    %number of people excluded
    nExcluded_counter = sum(passengersTiming(:, 10) == -1);
    nExcluded_gate = sum(passengersTiming(:, 10) < -1);
    
    queuesStats = [stats_counter, stats_security];
    otherStats = [nExcluded_counter, nExcluded_gate];
end