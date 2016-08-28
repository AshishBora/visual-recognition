function Data = genData(f1, f2, matchMatrix)
    
    f1 = f1(1:2,:);
    f2 = f2(1:2,:);
    matchMatrix = matchMatrix(1:2,:);
    
    n = size(matchMatrix, 2);
    Data = zeros(n, 4);
    
    for i = 1 : n
        Data(i,1:2) = f1(:, matchMatrix(1,i))';
        Data(i,3:4) = f2(:, matchMatrix(2,i))';
    end    
    
end