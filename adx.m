function adx = adx(high,low,close)     % Wilder's DMI (ADX)
observ = length(high);  
adx = nan(observ,1);
up = high      
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
        