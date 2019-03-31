function [sma_out,status] = sma(data,lag,varargin)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end

% Preallocate output
sma_out   = nan(nsamples,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of nsamples, then bail
if lag >= nsamples
    status = 0;
    return
end

ma = filter(ones(1,lag)/lag,1,data);

% Fill in the nan's
sma_out(lag:end) = ma(lag:end);
end

