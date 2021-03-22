function plane = initializePlane(baseTime, passengers_and_timing, config)
    passengers = passengers_and_timing{1,1};
    passengersTiming = passengers_and_timing{1,2};    
    [queuesStats, otherStats] = ARR.getPlaneStat(passengersTiming, config);
    
    plane = {baseTime, passengers, passengersTiming, queuesStats, otherStats};
end
