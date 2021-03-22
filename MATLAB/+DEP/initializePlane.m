function plane = initializePlane(baseTime, config)
    gate = ceil(rand()*4);
    passengers = DEP.initializePassengers(gate, config);
    passengersTiming = DEP.getPassengersTiming(passengers, baseTime, config);
    [queuesStats, otherStats] = DEP.getPlaneStat(passengersTiming, config);
    
    plane = {baseTime, gate, passengers, passengersTiming, queuesStats, otherStats};
end

