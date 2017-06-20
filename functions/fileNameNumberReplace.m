function [ fname ] = fileNameNumberReplace( fname )
% this function checks whether the file already exists and finds the
% highest number of the file and then replaces the number of file with the
% next number to avoid overwriting

    while exist(fname, 'file')
        % File exists
        fname = fname(1:end-4);
        occurances = regexp(fname, '-');
        indexOfFileNumber = max(occurances);
        noOfFile = fname((indexOfFileNumber+1):end);
        noOfFile = str2num(noOfFile);
        noOfFile = noOfFile + 1;
        
        fname = fname(1:indexOfFileNumber);
        fname = char(strcat(fname, num2str(noOfFile), '.txt'));
    end

end

