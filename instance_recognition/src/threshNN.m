function matchMatrix = threshNN(matchMatrix1, frac)
    
    % Accept match as valid if NND < frac*mean(NND)
    
    NND = matchMatrix1(3,:);
    valid = (NND < frac*mean(NND));
    matchMatrix = matchMatrix1(:, valid);
    
end