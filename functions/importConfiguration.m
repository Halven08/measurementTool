function [ configurationData ] = importConfiguration()

global nameIndex; % not something I'm proud of but the only thing that actually worked
global placeIndex;
global ledIndex;
global stateIndex;
global handIndex;

guiData = importGuiData('guiData.txt');

nameIndex = guiData.nameIndex{:};
placeIndex = guiData.placeIndex{:};
ledIndex = guiData.ledIndex{:};
stateIndex = guiData.stateIndex{:};
handIndex = guiData.handIndex{:};

patientData = importPatientData('patientData.txt');
placeData = importPlaceData('placeData.txt');
ledData = importLedData('ledData.txt');
stateData = importStateData('stateData.txt');
handData = importHandData('handData.txt');
configurationData = struct('patientData', patientData, 'placeData', placeData,...
                            'ledData', ledData, 'stateData', stateData,...
                            'handData', handData);
                        
end

