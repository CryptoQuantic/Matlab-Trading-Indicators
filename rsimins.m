function [value,length] = rsimins(data,lag)

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
length   = nan(nsamples,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of nsample, then bail
if lag >= nsamples
    status = 0;
    return
end

% Calculate RSI.
rsi14 = rsi(data,14);

for j = lag:nsamples
    if(rsi14
end

end


