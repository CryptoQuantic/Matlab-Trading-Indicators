function [a,b] = dema_trendline(data,lag1,lag2)

[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end



% Preallocate output
a = nan;
b = nan;
highlengths   = nan(nsamples,1);

% Calculate MA.
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


