function [ measurementName ] = setMeasurementName( measurementName, configurationData )

global nameIndex; % not something I'm proud of but the only thing that actually worked
global placeIndex;
global ledIndex;
global stateIndex;
global handIndex;

measurementName.Name = configurationData.patientData.Name{nameIndex};
measurementName.Surname = configurationData.patientData.Surname{nameIndex};
measurementName.NameCode = configurationData.patientData.Code{nameIndex};
measurementName.Place = configurationData.placeData.Place{placeIndex};
measurementName.PlaceCode = configurationData.placeData.Code{placeIndex};
measurementName.Led = configurationData.ledData.Led{ledIndex};
measurementName.LedCode = configurationData.ledData.Code{ledIndex};
measurementName.State = configurationData.stateData.State{stateIndex};
measurementName.StateCode = configurationData.stateData.Code{stateIndex};
measurementName.Hand = configurationData.handData.Hand{handIndex};
measurementName.HandCode = configurationData.handData.Code{handIndex};
end

