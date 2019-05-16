function [dema_out,status] = dema(data,lag1,lag2)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end




% Preallocate output
dema_out   = nan(nsamples,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of nsample, then bail
if lag1+lag2 >= nsamples
    status = 0;
    return
end

ema1 = ema(data,lag1);
ema2 = ema(ema1(lag1:end),lag2);
dema_out(lag1:end) = ema2;
status=1;
end