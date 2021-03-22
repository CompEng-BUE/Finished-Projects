function queuesStats = getQueueStat(arrivalTime, serviceStartTime, serviceEndTime)
    if isempty(arrivalTime)
        queuesStats = [0, 0, 0, 1];
    else
        times = sortrows([arrivalTime, ones(length(arrivalTime), 1); serviceEndTime, ones(length(serviceEndTime), 1) * -1]);
        times(:, 2) = cumsum(times(:, 2));
        [L, indices, ~] = unique(times(:, 1), 'last');
        L = [L, times(indices, 2)];

        Lq = L;
        Lq(:, 2) = max(Lq(:, 2) - 1, 0);
        Lq_avg = sum((Lq(2:end, 1) - Lq(1:end - 1, 1)) .* Lq(1:end - 1, 2)) / 240;

        zeroIndices_1 = L(:, 2) == 0;
        zeroIndices_1(end) = 0;
        zeroIndices_2 = [false; zeroIndices_1(1:end - 1)];
        base = floor(L(1, 1) / 240);
        firstPeriod = L(1, 1) - 240 * base;
        lastPeriod = 240 - (L(end, 1) - 240 * base);
        idlenessPercentage = max((sum(L(zeroIndices_2, 1) - L(zeroIndices_1, 1)) + firstPeriod + lastPeriod)/ 240, 0);

        Wq_avg = mean(serviceStartTime - arrivalTime);
        Ws_avg = mean(serviceEndTime   - serviceStartTime);

        queuesStats = [Wq_avg, Ws_avg, Lq_avg, idlenessPercentage];
    end
end