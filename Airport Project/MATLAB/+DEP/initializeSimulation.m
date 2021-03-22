function simulation = initializeSimulation(nDays, names, config)
    days = cell(nDays, 3);
    for i = 1:nDays
        days(i, :) = DEP.initializeDay(names, config);
    end
    [queuesStats, otherStats] = DEP.getSimulationStat(days);
    
    simulation = {days, queuesStats, otherStats};
end

