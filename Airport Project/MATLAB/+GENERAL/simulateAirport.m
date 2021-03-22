function simulationReport = simulateAirport(nDays, names, configDEP, configARR)
    simulationReport = cell(2, 3);
    simulationReport(1, :) = DEP.initializeSimulation(nDays, names, configDEP);
    simulationReport(2, :) = ARR.initializeSimulation(nDays, names, configARR);
end