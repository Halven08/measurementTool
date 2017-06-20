function [ measurementData, dataToSave, myAxes, xValues ] = setBufforAndAxes( bufforSize, measurementName )

if(~exist('myAxes','var'))
    
    index = 1:bufforSize; 
    zeroIndex = double(zeros(size(index))); 
    measurementData = zeroIndex;
    limits = [0 1025];
    
    myAxes = axes('Xlim',[0 bufforSize],'Ylim',limits);
    grid on;
    title(strcat(measurementName.Name, {' '}, measurementName.Surname, {' '}, measurementName.Place,...
                  {' '}, measurementName.Led, {' '}, measurementName.Hand, {' '}, measurementName.State));
    xValues = line(index,[measurementData;zeroIndex]);
    dataToSave = 0;
    drawnow;
end

end

