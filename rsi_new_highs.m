function [value,highlengths] = rsi_new_highs(data,lag)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end



% Preallocate output
value   = nan(nsamples,1);
highlengths   = nan(nsamples,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of nsample, then bail
if lag +14 >= nsamples
    status = 0;
    return
end

% Calculate RSI.
rsi14 = rsi(data,14);
currentlength=0;
for j = (lag+14):nsamples
    rsihigh = max(rsi14((j-lag):j-1));
    if(rsi14(j)>=rsihigh) %new low on rsi!
        value(j)=data(j);
        currentlength = 0;       
    else
        value(j) = value(j-1);
        currentlength = currentlength+1;
    end
    highlengths(j) = currentlength;
end

end


