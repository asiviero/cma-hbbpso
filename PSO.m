% Program parameters
inertiaWeight = 0.729;
c1 = 1.49445;
c2 = 1.49445;

% Initializing the particles
nParticles = 20;
nIterations = 100;
dimension = 2;
upperBound = 100;
pBestVector = zeros(nParticles,dimension+1);

swarm = particle.empty(nParticles,0);
for i = 1:nParticles
    swarm(i) = particle(2, rand(1,dimension)*upperBound);
    swarm(i).pbest = swarm(i).position;
    pBestVector(i,1) = swarm(i).position(1);
    pBestVector(i,2) = swarm(i).position(2);
    pBestVector(i,3) = test_function(swarm(i).position(1),swarm(i).position(2));
end

% Main Loop
for i = 1:nIterations
    
    % Defining gBest
    tmp = sortrows(pBestVector,3);
    gBest = horzcat(tmp(1,1),tmp(1,2));
    
    % Iterating over the particles
    for j = 1:nParticles
        % Move particle
        swarm(j).updateParticleVelocity(gBest,inertiaWeight,c1,c2);
        swarm(j).updateParticlePosition;
        % Check if position found is better than previous
        if(test_function(swarm(j).position(1),swarm(j).position(2)) < pBestVector(j,3))
            swarm(j).pbest = swarm(j).position;
            
            % Update pBestVector
            pBestVector(j,1) = swarm(j).position(1);
            pBestVector(j,2) = swarm(j).position(2);
            pBestVector(j,3) = test_function(swarm(j).position(1),swarm(j).position(2));
        else % return to previous position
            swarm(j).position = swarm(j).position - swarm(j).velocity;
        end
        
    end
    
end