function detect(im1, im2, f1, d1, name)
    
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
    
    % RANSAC
    % Convert matches to standard form for RANSAC
    Data = genData(f1, f2, matchMatrix);
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
        outName = strcat(name, '_boundary.png');
        set(gca,'LooseInset',get(gca,'TightInset'));
        print(outName{1},'-dpng');
    else
        fprintf('Template object not found.\n')
    end
    
    % take a deep breath
    fprintf('\n\n\n')
    pause;
    close all;
    
end
