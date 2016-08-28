function SIFT_matching(im1, im2, f1, d1)
        
    % Extract SIFT features from the scene image
    [f2, d2] = vl_sift(im2);
    fprintf('%d SIFT features detected in scene image\n', size(f1,2));
    
    % Initial candidate matches:
    % For every feature in the template, find the nearest and second
    % feature in the scene. Record the nearest match as a column in the
    % matrix 'matchMatrix1', where the first row gives the index of the
    % feature from the first image, the second row gives the index of the
    % feature matched to it in the second image, and the third row records
    % the distance between them. matchMatrix2 is similar but records the
    % second nearest neighbour.
    [matchMatrix1, matchMatrix2] = match(d1, d2);
    
    % Reduce candidate matches:
    % Filter the initial matches based on Lowe's ratio test.
    % That is, eliminate matches for which the distance to the
    % first neighbor divided by the distance to the second neighbor is
    % above a threshold (0.6 or 0.8)
    frac = 0.6;
    matchMatrix = threshRatio(matchMatrix1, matchMatrix2, frac);
    fprintf('%d matches remain after Lowe ratio test\n', size(matchMatrix,2));
    
    % Show the features that actually match
    fprintf('Showing the remaining matched patches\n')
    f1_match = f1(:, matchMatrix(1,:));
    d1_match = d1(:, matchMatrix(1,:));
    f2_match = f2(:, matchMatrix(2,:));
    d2_match = d2(:, matchMatrix(2,:));
    N_match = size(matchMatrix, 2);
    figure;
    displayDetectedSIFTFeatures(im1, im2, f1_match, f2_match, d1_match, d2_match, N_match);
    title('Patches remaining after Lowe ratio test')
    
    % % Display the matched patches one at a time
    % figure;
    % showMatchingPatches(matchMatrix, d1, d2, f1, f2, im1, im2, 0);
    % fprintf('Showing an example of a nearest neighbor patch match.  Type dbcont to continue.\n');
    
    % Show lines connecting the matches (no patches)
    % Allows to visualize the the connections without clutter of the
    % patches.
    figure;
    fprintf('Showing the matches with lines connecting.  Type dbcont to continue.\n');
    showLinesBetweenMatches(im1, im2, f1, f2, matchMatrix);
    title('Patches after Lowe ratio test')
    
    Data = genData(f1, f2, matchMatrix); % Convert to standard form for RANSAC
    [estimate, inliers] = affine_RANSAC(Data, 300, 5);
    
    % Detection decision
    % If the number of features matched are >= detect_thresh, then declare
    % detection. Elese declare failure.
    inlier_count = length(inliers);
    detect_thresh = 6;
    if inlier_count >= detect_thresh
        fprintf('Template object found.\nDisplaying it in scene image... \n')
        % Display the resulting best affine warp of the template boundaries on the scene image
        warp_disp(im1, im2, estimate)
    else
        fprintf('Template object not found.\n')
    end
    
    % take a deep breath
    fprintf('\n\n\n')
    pause;
    close all;
    
end
