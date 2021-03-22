function day = initializeDay(names, config)
    companies = cell(length(names), 4);
    for i = 1:length(names)
        companies(i,:) = DEP.initializeCompany(names(i), config);
    end
    [queuesStats, otherStats] = DEP.getDayStat(companies);
    
    day = {companies, queuesStats, otherStats};
end
