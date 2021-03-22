function passengers = initializePassengers(gate, config)
    passengers = zeros(100, 7);
    passengers(ceil(rand(config(1), 1)*100), 1) = 1;
    passengers(:, 2) = rand(100, 1) > config(2);
    passengers(:, 3) = exprnd(config(3), 100, 1);
    mean_ServCounter = passengers(:, 2) * (config(4) - config(5)) + config(5);
    passengers(:, 4) = exprnd(mean_ServCounter);
    passengers(:, 5) = rand(100, 1) * (config(7) - config(6)) + config(6);
    passengers(:, 6) = exprnd(config(8), 100, 1);
    LBGateDelay      = config(9) + (gate - 1) * (config(10) - config(9));
    passengers(:, 7) = rand(100, 1) * (config(10) - config(9)) + LBGateDelay;
end