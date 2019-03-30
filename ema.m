function [vout,status] = ema(data,lag,varargin)
observ = length(data)
if isempty(varargin)
    k = 2/(lag+1);
else
    lfactor = varargin{1};
    k = lfactor/(lag)
end


% Preallocate output
vout   = nan(observ,1);
% Set status
status = 1;
% If the lag is greater than or equal to the number of observations
if lag >= observ
    status = 0;
    return
end
% Calculate the exponential percentage

% Calculate the simple moving average for the first 'exp mov avg' value.
vout(lag) = sum(data(1:lag))/lag;
% K*vin; 1-k
kvin = data(lag:observ)*k;
oneK = 1-k;
% First period calculation
vout(lag) = kvin(1)+(vout(lag)*oneK);
% Remaining periods calculation
for i1 = lag+1:observ
    vout(i1) = kvin(i1-lag+1)+(vout(i1-1)*oneK);
end
end


