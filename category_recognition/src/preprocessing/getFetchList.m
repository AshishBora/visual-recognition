function getFetchList(ImNames, outName)
    fileID = fopen(outName,'w');    
    [C, N] = size(ImNames);
    for i = 1:C
        for j = 1:N
            imPath = ImNames(i,j);
            entry = [imPath{1}, ' ', num2str(i-1)];
            fprintf(fileID, '%s\n', entry);
        end
    end
    fclose(fileID);
end