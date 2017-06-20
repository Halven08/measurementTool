function [  ] = saveConfiguration( fname, indexArray )
    
   fname = strcat('configurationFiles\', fname);
   fileID = fopen(fname,'w');
   fprintf(fileID,'%d\r\n', indexArray);
   fclose(fileID);
   %disp(strcat('File successfuly saved as ',{' '}, fname));

end

