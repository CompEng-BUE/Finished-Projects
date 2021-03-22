clear;
clc;

configDEP = [20, 0.2, 2.1, 3, 2, 5, 15, 2, 0, 5, 1, 1, 1, 1];
configARR = [0.2, 0.2, 1/12, 1/12, 3, 8, 1, 5, 10, 5, 30, 3, 8, 2, 5, 10, 0.01, 4, 2, 4];

simulationReport = GENERAL.simulateAirport(365, ["RUSSIAN Airlines", "French Airelines"], configDEP, configARR);
