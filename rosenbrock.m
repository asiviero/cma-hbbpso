function r = rosenbrock(args)    
    r = 0;
    for i = 1:size(args,2)-1
       r = r + 100*(args(i+1)-args(i)^2)^2 + (args(i)-1)^2; 
    end
end