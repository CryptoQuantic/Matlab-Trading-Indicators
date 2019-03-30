function [ema_out,status] = ema(data,lag,varargin)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end


% Specify k, o input = standard ema, 1 = Wilders Moving Average

if isempty(varargin)
    k = 2/(lag+1);
else
    lfactor = varargin{1};
    k = lfactor/(lag)
end


% Preallocate output
ema_out   = nan(nsamples,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of nsample, then bail
if lag >= nsamples
    status = 0;
    return
end

% Calculate the simple moving average for the first 'exp mov avg' value.
ema_out(lag) = sum(data(1:lag))/lag;
% K*vin; 1-k
kvin = data(lag:nsamples)*k;
% First period calculation
ema_out(lag) = kvin(1)+(ema_out(lag)*(1-k));
% Remaining periods calculation
for i1 = lag+1:nsamples
    ema_out(i1) = kvin(i1-lag+1)+(ema_out(i1-1)*(1-k));
end
end


