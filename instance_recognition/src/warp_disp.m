function warp_disp(template, img, estimate)
    
    % get the boundary points of template
    [M, N] = size(template);
    Points = [1, 1;
        1, M;
        N, 1;
        N, M];
    
    % get A and b from estimate vector
    [A, b] = getAb(estimate);
    
    % Transform boundary points
    NewPoints = bsxfun(@plus, A*Points', b);
    
    % Show the scene image with a green quadrilateral of transformed
    % boundary points of template image overlayed on top
    figure;
    imshow(img);
    drawRectangle(NewPoints, 'g');
    
end