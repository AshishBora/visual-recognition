% RANSAC to estimate affine transformation

function [estimate, best_inliers] = affine_RANSAC(Data, num_iter, dist_thresh)
       
    k = 3; % minimum number of datapoints for affine fitting
    % num_iter = number of iterations
    % dist_thresh = inlier threshold
    
    get_estimate = @(Data)(get_affine_estimate(Data)); % affine estimator
    get_inliers = @(Data, estimate)(get_inliers_affine(Data, estimate, dist_thresh)); % returns inliers
    [estimate, best_inliers] = RANSAC(Data, k, get_estimate, get_inliers, num_iter); % Run RANSAC
    
end