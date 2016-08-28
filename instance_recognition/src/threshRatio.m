function matchMatrix = threshRatio(matchMatrix1, matchMatrix2, frac)
    
    % Accept match as valid if NND/SNND < thresh
    
    ratio = matchMatrix1(3,:) ./ matchMatrix2(3,:);
    
    % for deciding threshold, look at ratio histogram 
    % figure(2);
    % hist(ratio);
    % figure(1);
    
    valid = (ratio < frac);
    matchMatrix = matchMatrix1(:, valid);
    
end