function matchComp(im1, im2, f1, d1, name)
    
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

    % Show lines connecting the initial matches (no patches)
    figure;
    showLinesBetweenMatches(im1, im2, f1, f2, matchMatrix1);
    title('Initial matches')
    outName = strcat(name, '_init.png');
    set(gca,'LooseInset',get(gca,'TightInset'));
    print(outName{1},'-dpng');
    
    % Reduce candidate matches:
    % Threshold the initial matches on Eucledean distance
    frac = 0.8;
    matchMatrix = threshNN(matchMatrix1, frac);
    fprintf('%d matches remain after Thresholding on Nearest Neighbours\n', size(matchMatrix,2));
    % Show lines connecting the remaining matches (no patches)
    figure;
    showLinesBetweenMatches(im1, im2, f1, f2, matchMatrix);
    title('Matches after thresholding Eucledean distance')
    outName = strcat(name, '_threshNN.png');
    set(gca,'LooseInset',get(gca,'TightInset'));
    print(outName{1},'-dpng');

    % Reduce candidate matches:
    % Threshold the initial matches using Lowe's test
    frac = 0.6;
    matchMatrix = threshRatio(matchMatrix1, matchMatrix2, frac);
    fprintf('%d matches remain after Lowe ratio test\n', size(matchMatrix,2));
    % Show lines connecting the remaining matches (no patches)    
    figure;
    showLinesBetweenMatches(im1, im2, f1, f2, matchMatrix);
    title('Matches after Lowe ratio test')
    outName = strcat(name, '_threshRatio.png');
    set(gca,'LooseInset',get(gca,'TightInset'));
    print(outName{1},'-dpng');
    
    % RANSAC
    % Convert to standard form for RANSAC
    Data = genData(f1, f2, matchMatrix);
    [~, inliers] = affine_RANSAC(Data, 300, 5);
    matchMatrix = matchMatrix(:, inliers);
    % Show RANSAC inliers
    figure;
    showLinesBetweenMatches(im1, im2, f1, f2, matchMatrix);
    title('RANSAC inliers mathces after ratio test')
    outName = strcat(name, '_RANSAC_inliers.png');
    set(gca,'LooseInset',get(gca,'TightInset'));
    print(outName{1},'-dpng');
    
    % take a deep breath
    fprintf('\n\n\n')
    pause;
    close all;

end

