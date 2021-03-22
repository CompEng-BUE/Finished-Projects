function passengersTiming = getPassengersTiming(passengers, baseTime, config)
    ExclusionTime_counter = 210 + 60 * baseTime;
    ExclusionTime_gate    = 240 + 60 * baseTime;
    
    passengersTiming = ones(100, 10) .* [0, 0, 0, -1, -1, 0, -1, -1, -1, -1];
    passengersTiming(:, 3) = baseTime * 60 + cumsum(passengers(:, 3));
    isIncluded = (passengersTiming(:, 3) <= ExclusionTime_counter);
    counterTypes = [2, 1, 3, 3];
    passengersTiming(isIncluded, 1) = counterTypes(2 * passengers(isIncluded, 1) + passengers(isIncluded, 2) + 1);
    
    x1 = passengersTiming(:, 1) == 1;
    x2 = passengersTiming(:, 1) == 2;
    x3 = passengersTiming(:, 1) == 3;
    [passengersTiming(x1, 2), passengersTiming(x1, 4), passengersTiming(x1, 5)] = GENERAL.modelQueue(passengersTiming(x1, 3), passengers(x1, 4), config(11), sum(x1));
    [passengersTiming(x2, 2), passengersTiming(x2, 4), passengersTiming(x2, 5)] = GENERAL.modelQueue(passengersTiming(x2, 3), passengers(x2, 4), config(12), sum(x2));
    [passengersTiming(x3, 2), passengersTiming(x3, 4), passengersTiming(x3, 5)] = GENERAL.modelQueue(passengersTiming(x3, 3), passengers(x3, 4), config(13), sum(x3));
    
     passengersTiming(isIncluded,  7) = passengersTiming(isIncluded, 5) + passengers(isIncluded, 5);
    [passengersTiming(isIncluded,  6),  passengersTiming(isIncluded, 8), passengersTiming(isIncluded, 9)] = GENERAL.modelQueue(passengersTiming(isIncluded, 7), passengers(isIncluded, 6), config(14), sum(isIncluded));
     passengersTiming(isIncluded, 10) = passengersTiming(isIncluded, 9) + passengers(isIncluded, 7);
    
    %excluding late arrivals at boarding gates
    notIncluded = (passengersTiming(:, 10) > ExclusionTime_gate);
    passengersTiming(notIncluded, 10) = passengersTiming(notIncluded, 10) * -1;
end

