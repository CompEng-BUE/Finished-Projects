function company = initializeCompany(name, passengers_and_timing, config)
    planes = cell(6, 5);
    for i = 1:6
        planes(i, :) = ARR.initializePlane((i * 4 - 4), passengers_and_timing(i, :), config); %baseTimes: 0,4,8,12,16,20
    end
    [queuesStats, otherStats] = ARR.getCompanyStat(planes);
    
    company = {name, planes, queuesStats, otherStats};
end
