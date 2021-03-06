function [Di_plus,Di_minus,adx_out] = adx(high,low,close,period1,period2)     % Wilder's DMI (ADX)
[l,w] = size(high);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    high = high'
    low = low';
    close = close';
    nsamples = w;
end

% Preallocate output
adx_out   = nan(nsamples,1);

%Calculate the Directional Movement
up = [0;high(2:nsamples)-high(1:nsamples-1)];
down = -[0;low(2:nsamples)-low(1:nsamples-1)];
atr = ema(truerange(high,low,close),period2,1);


DM_plus = ((up>down) & up >0).*up;
DM_minus = ((down>up) & down >0).*down;

Di_plus = 100*ema(DM_plus,period2,1)./atr
Di_minus = 100*ema(DM_minus,period2,1)./atr
% 
Di_sum = Di_plus +  Di_minus;
Di_sum  = Di_sum + (Di_sum == 0); %turn zeros into 1's
Di_absdelta = abs(Di_plus - Di_minus)
Di_sum = Di_sum(period2,end);
Di_absdelta = Di_absdelta(period2:end)
adx_out(period2:end) = 100*ema(Di_absdelta./Di_sum,period1,1);


% dirmov(len) =>
% 	up = change(high)
% 	down = -change(low)
% 	truerange = rma(tr, len)
% 	plus = fixnan(100 * rma(up > down and up > 0 ? up : 0, len) / truerange)
% 	minus = fixnan(100 * rma(down > up and down > 0 ? down : 0, len) / truerange)
% 	[plus, minus]        
% adx(LWdilength, LWadxlength) => 
% 	[plus, minus] = dirmov(LWdilength)
% 	sum = plus + minus
% 	adx = 100 * rma(abs(plus - minus) / (sum == 0 ? 1 : sum), LWadxlength)
% 	[adx, plus, minus]
% 
% [ADX, up, down] = adx(LWdilength, LWadxlength)
% LWADX= (ADX-15)*2.5
% adxcolor= up>down?green: red
% plot(LWADX, color=adxcolor, title="Trend Strength")
% plot (LWADX, color=adxcolor , style= histogram, linewidth= 4)
% 
% plot(0, color=black, title="Chop Zone")
% plot(20, color=green, title="Mendoza Line", linewidth=1)
% plot(100, color=red, title=" Extreme Zone", linewidth=1)
       
end
        