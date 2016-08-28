function createListFile(ImNames, outName)
    fileID = fopen(outName,'w');    
    [C, N] = size(ImNames);
    for i = 1:C
        for j = 1:N
            imName = ImNames(i,j);   
            temp = strsplit(imName{1}, '/');
            imName = temp(end);
            imPath = [num2str(i-1), '/', imName{1}];
            entry = [imPath, ' ', num2str(i-1)];
            fprintf(fileID, '%s\n', entry);
        end
    end
    fclose(fileID);
end