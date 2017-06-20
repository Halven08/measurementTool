function [  ] = createFolder( folderPath )

    if (7 ~= exist(folderPath, 'dir'))
        mkdir(folderPath);
    end

end

