function r = sphere_4d(args)
    %r = x1^2+x2^2+x3^2+x4^2;
    r = 0;
    for i = 1:size(args,2)
       r = r+args(i)^2; 
    end
end