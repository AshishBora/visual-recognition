function [estimate, best_inliers] = RANSAC(Data, k, get_estimate, get_inliers, num_iter)
    
    % Assume each row is a single datapoint
    N = size(Data,1);
    
    best_inlier_count = 0;
    
    for i = 1 : num_iter
        temp = randperm(N);
        current_k = temp(1:k);
        k_estimate = get_estimate(Data(current_k,:));
        inliers = get_inliers(Data, k_estimate);
        inlier_count = length(inliers);
        if (inlier_count > best_inlier_count)
            best_inlier_count = inlier_count;
            best_inliers = inliers;
        end
    end
    
    fprintf('best_inlier_count = %d\n', best_inlier_count)

    % get the final estimate with all the inliers
    estimate = get_estimate(Data(best_inliers, :));
    
    
end