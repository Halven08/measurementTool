function [ figureHandle, saveButton, stopButton, markButton, timeText] = createFigure()


if (~exist('h','var') || ~ishandle(figureHandle))
    figureHandle = figure(1);
    set(figureHandle,'UserData',1);
end


%title(strcat(measurementName.Name, {' '}, measurementName.Surname, {' '}, measurementName.Finger));

% After creating a system of two axis, a line object through which the data
% will be plotted is also created

if (~exist('saveButton','var'))
    saveButton = uicontrol('Style','togglebutton','String','Save',...
        'Position',[50 0 50 25], 'parent',figureHandle);
end
if (~exist('stopButton','var'))
    stopButton = uicontrol('Style','togglebutton','String','Stop',...
        'Position',[0 0 50 25], 'parent',figureHandle);
end
if (~exist('markButton','var'))
    markButton = uicontrol('Style','togglebutton','String','Mark',...
        'Position',[100 0 50 25], 'parent',figureHandle);
end

if (~exist('timeText','var'))
    timeText = uicontrol('Style','text','String','',...
        'FontSize', 12, 'Position',[150 0 75 25], 'parent',figureHandle);
end
% Create pop-up menu
%     patientSelection = uicontrol('Style', 'popup',...
%            'String', strcat(patientData.Name,{' '}, patientData.Surname),...
%            'Position', [20 340 100 50],...
%            'Callback', {@setPatient, patientData, measurementName});    
%        
%     measurementName = setPatient(patientSelection, '', patientData, measurementName);
end

