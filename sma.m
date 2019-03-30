function sma = sma(data,smoothlength)
n = length(data);
sma = zeros(n,1);
for j = 1:n
    if j<smoothlength
        sma(j) = nan;
    else
        dataseg = data((j-smoothlength+1):j);
        sma(j) = sum(dataseg)/smoothlength;
    end
end

