function valid = get_inliers_affine(Data, estimate, thresh)
    
    [A, b] = getAb(estimate);
    
    X = Data(:, 1:2)';
    Target = Data(:, 3:4)';
    
    Pred = bsxfun(@plus, A*X, b);
    Dist = sum((Pred - Target) .^ 2);
    valid = find((Dist < thresh));
    
end