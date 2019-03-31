function [polyMA,polySlope,poly2ndDir] = polySMA(data,period,order)

fit = polyfit(xfit,ma(j-60:j),3);
y5 = polyval(fit,xfit+5);