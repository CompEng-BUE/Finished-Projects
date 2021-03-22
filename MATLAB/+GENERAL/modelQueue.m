function [queueNumber, serviceStartTime, serviceEndTime] = modelQueue(arrivalTime, serviceTime, nQueues, nPassengers)
    %[index, queueNumber, arrivalTime, serviceTime, serviceStartTime, serviceEndTime]
    timings = [(1:nPassengers)', zeros(nPassengers,1), arrivalTime, serviceTime, zeros(nPassengers, 2)];

    maxServiceEndTime = zeros(1, nQueues);
    
    timings = sortrows(timings, 3);
    for i = 1:nPassengers
        a = timings(1:i - 1, 6) > timings(i, 3);
        npeopleInQueues = accumarray(timings(1:i - 1, 2), a, [nQueues, 1]);
        timings(i, 2) = find(npeopleInQueues == min(npeopleInQueues), 1);
        timings(i, 5) = max(timings(i, 3), maxServiceEndTime(timings(i, 2)));
        timings(i, 6) = timings(i, 4) + timings(i, 5);
        maxServiceEndTime(timings(i, 2)) = timings(i, 6);
    end
    timings = sortrows(timings, 1);

    queueNumber      = timings(:, 2);
    serviceStartTime = timings(:, 5);
    serviceEndTime   = timings(:, 6);
end