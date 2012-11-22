classdef particle < handle
    %PARTICLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        dimension;
        position;
        velocity;
        pbest;
    end
    
    methods
        function prtc = particle(dimension,positionArray)
           if nargin == 0 % Standard: Bidimensional
               prtc.position = zeros(1,2);
               prtc.velocity = rand(1,2);
               prtc.dimension = 2;
               %pbest = 1;
           elseif nargin == 1
               prtc.position = zeros(1,dimension);
               prtc.velocity = rand(1,dimension);
               prtc.dimension = dimension;
               %pbest = 1;
           elseif nargin == 2
               if(isequal(size(positionArray),[1 dimension]) || isequal(size(positionArray),[dimension 1]))
                  prtc.position = positionArray;
               else
                  error('Dimension informed is different of positionArray dimension'); 
               end
               prtc.velocity = rand(1,dimension);
               prtc.dimension = dimension;
           end
        end
        
        % Standard PSO Velocity Update
        function updateParticleVelocity(p,gBest,w,c1,c2)
               p.velocity = p.velocity*w;
               p.velocity = p.velocity + c1*rand*(p.pbest-p.position);
               p.velocity = p.velocity + c2*rand*(gBest-p.position);
            %end
        end
        
        function updateParticlePosition(p)
           p.position = p.position + p.velocity; 
        end
    end
    
end

