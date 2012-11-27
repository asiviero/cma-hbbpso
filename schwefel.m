function r = schwefel(args)    
    r = 0;
    r = sum(abs(args)) + prod(abs(args));
end