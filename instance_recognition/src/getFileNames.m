function [templateName, sceneNames] = getFileNames(folderPath)
    
    files = dir(folderPath);
    sceneNames = {};
    
    fileNum = 1;
    for i = 1 : length(files)
        temp = files(i);
        temp_name = temp.name;
        
        is_invalid = (strcmp(temp_name, '.') || strcmp(temp_name,'..') || strcmp(temp_name,'.DS_Store'));
        if is_invalid
            continue
        end
                
        name = strsplit(temp_name, '.');
        name = name(1);
        if strcmp(name(1), 'template')
            templateName = strcat(folderPath, temp_name);
        else
            sceneNames{fileNum} = strcat(folderPath, temp_name);
            fileNum = fileNum + 1;
        end
        
    end