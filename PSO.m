function [gBest,fBest] = PSO(functionToOptimize,nParticles,nIterations,dimension,upperBound)

% Program parameters
inertiaWeight = 0.729;
c1 = 1.49445;
c2 = 1.49445;

% Initializing the particles
%nParticles = 20;
%nIterations = 100;
%dimension = 2;
%upperBound = 100;
pBestVector = zeros(nParticles,dimension+1);

swarm = particle.empty(nParticles,0);
for i = 1:nParticles
    swarm(i) = particle(dimension, rand(1,dimension)*upperBound);
    swarm(i).pbest = swarm(i).position;
    for j=1:dimension
        pBestVector(i,j) = swarm(i).position(j);
    end
    pBestVector(i,dimension+1) = feval(functionToOptimize,swarm(i).position);
end


    % Defining gBest
    tmp = sortrows(pBestVector,dimension+1);
    gBest = zeros(1,dimension);
    for k = 1:dimension
        gBest(k) = tmp(1,k);
    end
    
    
% Main Loop
for i = 1:nIterations
    

    
    % Iterating over the particles
    for j = 1:nParticles
        % Move particle
        swarm(j).updateParticleVelocity(gBest,inertiaWeight,c1,c2);
        swarm(j).updateParticlePosition;
        
        % Check if position found is better than previous
        out = feval(functionToOptimize,swarm(j).position);

        if(out < pBestVector(j,dimension+1))
            swarm(j).pbest = swarm(j).position;
            
            % Update pBestVector
            for k=1:dimension
                pBestVector(j,k) = swarm(j).position(k);
            end
            pBestVector(j,dimension+1) = out;
        else % return to previous position
            swarm(j).position = swarm(j).position - swarm(j).velocity;
        end
        
    end
    
    % Defining gBest
    tmp = sortrows(pBestVector,dimension+1);
    gBest = zeros(1,dimension);
    for k = 1:dimension
        gBest(k) = tmp(1,k);
    end
    fBest = tmp(1,dimension+1);
    
end

end