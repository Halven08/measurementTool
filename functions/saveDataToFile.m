function [ ] = saveDataToFile( measurementName, dataToSave)

    fname = strcat(measurementName.NameCode, {'-'}, measurementName.PlaceCode, ...
                   {'-'}, measurementName.HandCode, {'-'}, measurementName.LedCode, {'-1'});
    fname = char(strcat(measurementName.State, {'\'}, measurementName.Led, {'\'}, fname, '.txt'));

    folderName = char(strcat(measurementName.State, {'\'}, measurementName.Led));
    
    createFolder(measurementName.State);
    
    createFolder(folderName);
    
    fname = fileNameNumberReplace(fname);
    
    fileID = fopen(fname,'w');

    fprintf(fileID,'%f\r\n', dataToSave);
    fclose(fileID);
    disp(strcat('File successfuly saved as ',{' '}, fname));
    
end

