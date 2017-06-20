function [ measurementData ] = acquireData(serialConnection, closeButton, saveButton, markButton, timeText, measurementData, dataToSave, xValues, measurementName, enablePause, pauseDuration)
  
  acquiredSamples = 0; 
  samplesToDump = 4;
  startTime = datetime('now');
  try
    dumpSamples(serialConnection, samplesToDump);
  catch
      disp('Unable to dump samples...')
  end
  
  while (get(closeButton,'Value') == 0 )
        
        %odczyt danej do zmiennej Data
        %fprintf(serialConnection,'%c','i');
    currentSample = fscanf(serialConnection, '%f');
    
    measurementData = [measurementData(2:end),currentSample];

    if isnumeric(measurementData) == 0
       save('measurementData.mat', measurementData);
       warning('measurementData variable fail, saved to measurementData.mat')
    end
       
    set(xValues,'Ydata',measurementData);

    drawnow;
    acquiredSamples = acquiredSamples + 1;
    dataToSave(acquiredSamples) = currentSample;
    
    if (get(saveButton, 'Value') == 1)
        saveDataToFile(measurementName, dataToSave);
        set(saveButton, 'Value', 0);
    end
    
    if (get(markButton, 'Value') == 1)
         dataToSave(acquiredSamples) = -1;
         measurementData = [measurementData(2:end),-1];
         set(markButton, 'Value', 0)
    end
    
    runTime = char(datetime('now') - startTime);
    set(timeText, 'String', runTime);
    
    if(enablePause)
        pause(pauseDuration);
    end
 end

end

