% initialize passengers for all companies in a given time
function all_passengers = initializePassengers(nCompanies, config)
    n = 100 * nCompanies;
    all_passengers = zeros(n, 11);
    all_passengers(:,  1) =  rand(n, 1) <  config(1);
    all_passengers(:,  2) =  rand(n, 1) >  config(2);
    all_passengers(:,  3) =  rand(n, 1) * (config( 4) - config( 3)) + config( 3);
    all_passengers(:,  4) =  rand(n, 1) * (config( 6) - config( 5)) + config( 5);
    all_passengers(:,  5) =  exprnd(config(7), n, 1);
    all_passengers(:,  6) =  rand(n, 1) * (config( 9) - config( 8)) + config( 8);
    all_passengers(:,  7) = (rand(n, 1) * (config(11) - config(10)) + config(10)) .* all_passengers(:,2);
    all_passengers(:,  8) =  rand(n, 1) * (config(13) - config(12)) + config(12);
    all_passengers(:,  9) =  exprnd(config(14), n, 1);
    all_passengers(:, 10) =  rand(n, 1) * (config(16) - config(15)) + config(15);
    all_passengers(:, 11) =  rand(n, 1) <  config(17);
end

