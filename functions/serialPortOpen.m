function [ serialConnection ] = serialPortOpen( comPort, baudRate )

serialConnection = serial(comPort);
set(serialConnection,'DataBits',8);
set(serialConnection,'StopBits',1);
set(serialConnection,'BaudRate',baudRate);
set(serialConnection,'Parity','none');

try
    fopen(serialConnection);
    disp(['Connection with ', comPort, ' is open.']);
catch
    error('Unable to open COM port, connect your device and check the COM number')
end
    
end

