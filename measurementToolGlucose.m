clc
close all
clear all

addPathToWorkspace('functions');
addPathToWorkspace('configurationFiles');

% configuration parameters
comPort = 'COM3';
baudRate = 9600;
bufforSize = 2000;
enablePause = 0;
pauseDuration = 0.01;

configurationData = importConfiguration();

measurementName = prepareMeasurementName();


[~, data] = setPatientGUI(configurationData);

serialConnection = serialPortOpen(comPort, baudRate);

try 
    measurementName = setMeasurementName(measurementName, configurationData);

    [figureHandle, saveButton, closeButton, markButton, timeText] = createFigure();

    [measurementData, dataToSave, myAxes, xValues] = setBufforAndAxes( bufforSize, measurementName );

    acquireData(serialConnection, closeButton, saveButton, markButton, timeText,...
                   measurementData, dataToSave, xValues, measurementName,...
                   enablePause, pauseDuration);

catch ME
   serialPortClose(serialConnection);
   error(['Error occured during the measurement! ', ME.message]);
end

serialPortClose(serialConnection);


