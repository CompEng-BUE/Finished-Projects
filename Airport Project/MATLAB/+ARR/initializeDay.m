function day = initializeDay(names, config)
    passengers_and_timing = cell(6, 2);
    for i = 1:6
        passengers_and_timing{i, 1} = ARR.initializePassengers(length(names), config);
        passengers_and_timing{i, 2} = ARR.getPassengersTiming(passengers_and_timing{i, 1}, (i * 4 - 4), length(names), config);
    end
    [queuesStats, otherStats] = ARR.getDayStat(passengers_and_timing(:, 2), config);
    
    companies = cell(length(names), 4);
    passengers_and_timing_n = cell(6, 2);
    for i = 1:length(names)
        for j = 1:6
            passengers_and_timing_n{j, 1} = passengers_and_timing{j, 1}((i * 100 - 99:i * 100), :);
            passengers_and_timing_n{j, 2} = passengers_and_timing{j, 2}((i * 100 - 99:i * 100), :);
        end
        
        companies(i,:) = ARR.initializeCompany(names(i), passengers_and_timing_n, config);
    end
    
    day = {companies, queuesStats, otherStats};
end