function simulation = initializeSimulation(nDays, names, config)
    days = cell(nDays, 3);
    for i = 1:nDays
        days(i, :) = ARR.initializeDay(names, config);
    end
    [queuesStats, otherStats] = ARR.getSimulationStat(days);
    
    simulation = {days, queuesStats, otherStats};
end

