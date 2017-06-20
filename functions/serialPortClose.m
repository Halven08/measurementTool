function [ ] = serialPortClose( serialConnection )

    fclose(serialConnection);
    disp('Port COM closed!')

end

