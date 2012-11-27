function mu = calculateSwarmMeanVector(swarm,gbest,dimension)
    mu = zeros(size(swarm,2),dimension);
    for i = 1:size(swarm,2)
        %for j=1:dimension
            mu(i,:) = swarm(i).pbest + gbest;
        %end
    end
    mu = mu*0.5;
end