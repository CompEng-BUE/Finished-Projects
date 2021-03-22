function [queuesStats, otherStats] = getDayStat(passengersTiming, config)
    nQueues_visaClr = config(18:19);
    nQueues_secCus = config(20);
    
    queuesStats = cell(6, 1);
    otherStats = cell(6, 1);
	nCompanies = size(passengersTiming{1}, 1) / 100;
    
    for k = 1:6
        stats_visaClr = zeros(4, sum(nQueues_visaClr));
        x = 1;
        for i = 1:2
            for j = 1:nQueues_visaClr(i)
                indices = (passengersTiming{k}(:, 2) == i) & (passengersTiming{k}(:, 3) == j);
                stats_visaClr(:, x) = GENERAL.getQueueStat(passengersTiming{k}(indices, 4), passengersTiming{k}(indices, 5), passengersTiming{k}(indices, 6))';
                x = x + 1;
            end
        end

        stats_securitycus = zeros(4, nQueues_secCus);
        for j = 1:nQueues_secCus
            indices = (passengersTiming{k}(:, 9) == j);
            stats_securitycus(:, j) = GENERAL.getQueueStat(passengersTiming{k}(indices, 10), passengersTiming{k}(indices, 11), passengersTiming{k}(indices, 12))';
        end

        %number of people rejected
        nRejected = sum(passengersTiming{k}(:, 13) == -1) / nCompanies;
        
        queuesStats{k} = [stats_visaClr, stats_securitycus];
        otherStats{k} = nRejected;
    end
    
    queuesStats = mean(reshape(cell2mat(queuesStats)', [], 4, 6), 3)';
    otherStats = mean(cell2mat(otherStats), 1);
end
