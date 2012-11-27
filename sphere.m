function r = sphere(args)
    r = 0;
    for i = 1:size(args,2)
       r = r+args(i)^2; 
    end
end