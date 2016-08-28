function [matchMatrix1, matchMatrix2] = match(d_temp, d_scene)
    
    n_temp = size(d_temp, 2);
    matchMatrix1 = zeros(3, n_temp);
    matchMatrix1(1,:) = 1:n_temp;
    matchMatrix2 = matchMatrix1;
    
    % X = MxN, C = LxN
    % Ans = dist2(X, C)
    % Ans = MxL
    % Ans(i,j) = dist(X(i,:), Y(j,:))
    
    dists = dist2(double(d_temp'), double(d_scene'));
    
    [min_dists, min_ind] = min(dists, [], 2);
    matchMatrix1(2,:) = min_ind;
    matchMatrix1(3,:) = min_dists;
    
    lin_inds = sub2ind(size(dists), 1:n_temp, min_ind');
    dists(lin_inds) = Inf;
    
    [min_dists, min_ind] = min(dists, [], 2);
    matchMatrix2(2,:) = min_ind;
    matchMatrix2(3,:) = min_dists;   
    
end