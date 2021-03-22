% get passengersTiming for all companies in a given time
function all_passengersTiming = getPassengersTiming(all_passengers, baseTime, nCompanies, config)
    n = 100 * nCompanies;
    all_passengersTiming = ones(n, 13) .* [0, 0, 0, 0, 0, 0, -1, -1, 0, -1, -1, -1, -1];
    for i = 1:nCompanies
        all_passengersTiming(100 * i - 99:100 * i, 1) = baseTime * 60 + cumsum(all_passengers(100 * i - 99:100 * i, 3));        
    end
    all_passengersTiming(:, 2) = all_passengers(:, 1) + 1;
    all_passengersTiming(:, 4) = all_passengersTiming(:, 1) + all_passengers(:, 4);

    x1 = all_passengersTiming(:, 2) == 1;
    x2 = all_passengersTiming(:, 2) == 2;
    [all_passengersTiming(x1, 3), all_passengersTiming(x1, 5), all_passengersTiming(x1, 6)] = GENERAL.modelQueue(all_passengersTiming(x1, 4), all_passengers(x1, 5), config(18), sum(x1));
    [all_passengersTiming(x2, 3), all_passengersTiming(x2, 5), all_passengersTiming(x2, 6)] = GENERAL.modelQueue(all_passengersTiming(x2, 4), all_passengers(x2, 5), config(19), sum(x2));

    isIncluded = not(all_passengers(:, 11));
     all_passengersTiming(isIncluded,  7) = all_passengersTiming(isIncluded,  6) + all_passengers(isIncluded,  6);
     all_passengersTiming(isIncluded,  8) = all_passengersTiming(isIncluded,  7) + all_passengers(isIncluded,  7);
     all_passengersTiming(isIncluded, 10) = all_passengersTiming(isIncluded,  8) + all_passengers(isIncluded,  8);
    [all_passengersTiming(isIncluded,  9),  all_passengersTiming(isIncluded, 11),  all_passengersTiming(isIncluded, 12)] = GENERAL.modelQueue(all_passengersTiming(isIncluded, 10), all_passengers(isIncluded, 9), config(20), sum(isIncluded));
     all_passengersTiming(isIncluded, 13) = all_passengersTiming(isIncluded, 12) + all_passengers(isIncluded, 10);
end


