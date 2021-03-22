function company = initializeCompany(name, config)
    planes = cell(6, 6);
    for i = 1:6
        planes(i, :) = DEP.initializePlane((i * 4 - 4), config); %baseTimes: 0,4,8,12,16,20
    end
    [queuesStats, otherStats] = DEP.getCompanyStat(planes);
    
    company = {name, planes, queuesStats, otherStats};
end