function [gBest,fBest] = HBBPSO_schwefel(functionToOptimize,nParticles,nIterations,dimension,upperBound,nu)

% Program parameters
inertiaWeight = 0.729;
c1 = 1.49445;
c2 = 1.49445;


% mu+sigma.*randn(1,m); % m numbers from the N(mu,sigma^2)-distribution

% Initializing the particles
%nParticles = Particle;
%nIterations = Iterations;
%dimension = 3;
%upperBound = 100;
pBestVector = zeros(nParticles,dimension+1);

swarm = particle.empty(nParticles,0);

% Initializing Swarm
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
    
    
    
    % Statistical Parameters
    lambda = gamrnd(nu/2,nu/2);
    %lambda=1;
    
    mu = calculateSwarmMeanVector(swarm,gBest,dimension);
    sigma = calculateCovarianceMatrix(swarm,gBest,dimension);
    % Hierachical
    sigma = sigma/lambda;
    
    % Iterating over the particles
    for j = 1:nParticles
        
        % Move particle
        bkp_pos = swarm(j).position;
        swarm(j).position = (mu(j,:)'+sigma(:,:,j)*(randn(1,dimension))')';
        
        
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
            swarm(j).position = bkp_pos;
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