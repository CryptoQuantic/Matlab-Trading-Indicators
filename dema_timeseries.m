function [dema_table,currentSlope,currentCount] = dema_timeseries(data,lag1,lag2)
lookback = 2
[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end



% Preallocate output
segLows = []
segHighs = []
startIndicies = []
endIndicies = []
segSlopes = []
startVals = []
endVals = []


% Calculate MA.
dema1 = dema(data,lag1,lag2);
leadingNans = sum(isnan(dema1))

startIndex=1+leadingNans; %start calculating after the nans
lastSlope = dema1(startIndex+lookback)-dema1(startIndex);
lastSlope = lastSlope/abs(lastSlope);
currentCount = 0;
for j = (startIndex+lookback):nsamples
    currentSlope = dema1(j)-dema1(j-lookback);
    currentSlope = currentSlope/abs(currentSlope);
    if(currentSlope~=lastSlope) %start new segment
      
      %collect data from Segment  
      currentLow = min(data(startIndex:(j-1)));
      currentHigh = max(data(startIndex:(j-1)));
      startVal = dema1(startIndex);
      endVal = dema1(j-1);
      
      startVals = [startVals;startVal];
      endVals = [endVals;endVal];
      startIndicies = [startIndicies;startIndex];
      endIndicies = [endIndicies;j-1];
      segHighs = [segHighs;currentHigh];
      segLows = [segLows;currentLow];
      segSlopes = [segSlopes;lastSlope];
      
      %initialize next segment
      startIndex = j;
      lastSlope = currentSlope;
      currentCount=0;
    else
        currentCount=currentCount+1;
     %anything else?   
    end
end
 dema_table = table(segLows,segHighs,startIndicies,endIndicies,segSlopes,startVals,endVals); 

end


