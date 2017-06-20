function [] = dumpSamples( serialConnection, samplesToDump )

  for i = 1:samplesToDump 
        fscanf(serialConnection);
  end

end

