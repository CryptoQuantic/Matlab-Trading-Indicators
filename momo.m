function [momo_out] = momo(data,lag)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end

% Preallocate output
momo_out   = nan(nsamples,1);

% If the lag is greater than or equal to the number of nsamples, then bail
if lag >= nsamples
    return
end

momo = data(lag+1:end)-data(1:end-lag);

% Fill in the nan's
momo_out(lag+1:end) = momo;
end

