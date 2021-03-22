function [queuesStats, otherStats] = getPlaneStat(passengersTiming, config)
    nQueues_visaClr = config(18:19);
    nQueues_secCus = config(20);
    
    wq_visaClr = passengersTiming(:, 5) - passengersTiming(:, 4);
    ws_visaClr = passengersTiming(:, 6) - passengersTiming(:, 5);
    stats_visaClr = zeros(2, sum(nQueues_visaClr));
    x = 1;
    for i = 1:2
        for j = 1:nQueues_visaClr(i)
            indices = (passengersTiming(:, 2) == i) & (passengersTiming(:, 3) == j);
            stats_visaClr(1, x) = mean(wq_visaClr(indices));
            stats_visaClr(2, x) = mean(ws_visaClr(indices));
            x = x + 1;
        end
    end
    
    wq_secCus = passengersTiming(:, 11) - passengersTiming(:, 10);
    ws_secCus = passengersTiming(:, 12) - passengersTiming(:, 11);
    stats_secCus = zeros(2, nQueues_secCus);
    for j = 1:nQueues_secCus
        indices = (passengersTiming(:, 9) == j);
        stats_secCus(1, j) = mean(wq_secCus(indices));
        stats_secCus(2, j) = mean(ws_secCus(indices));
    end

    %number of people rejected
    nRejected = sum(passengersTiming(:, 13) == -1);
    
    queuesStats = [stats_visaClr, stats_secCus];
    otherStats = nRejected;
end