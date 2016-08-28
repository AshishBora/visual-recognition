function [A, b] = getAb(estimate)
    
    A = reshape(estimate(1:4), 2, 2)';
    b = estimate(5:6);
    
end

