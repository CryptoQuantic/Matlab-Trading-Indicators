function [count,direction] = dema_count(data,lag1,lag2)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end




% Preallocate output
count   = nan(nsamples,1);
direction = nan(samples,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of nsample, then bail
if lag1+lag2 >= nsamples
    status = 0;
    return
end

dema1 = dema(data,lag1,lag2);
leadingNans = sum(isnan(ema1))

startIndex=1+leadingNans; %start calculating after the nans
lastSlope = ema1(startIndex+lookback)-ema1(startIndex);
lastSlope = lastSlope/abs(lastSlope);

startDirection = lastSlope
for j = 1:
end