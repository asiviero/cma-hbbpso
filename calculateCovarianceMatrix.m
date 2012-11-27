function sigma = calculateCovarianceMatrix(swarm,gbest,dimension)
    sigma = zeros(dimension,dimension,size(swarm,2));
    for i = 1:size(swarm,2)
        sigma(:,:,i) = diag(swarm(i).pbest - gbest);
    end
end