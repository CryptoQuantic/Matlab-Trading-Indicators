function tr= truerange(high,low,close)
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

h_m_l = high-low;                                       % high - low
h_m_c = [0;abs(high(2:nsamples)-close(1:nsamples-1))];  % abs(high - close)
l_m_c = [0;abs(low(2:nsamples)-close(1:nsamples-1))];   % abs(low - close)
tr = max([h_m_l,h_m_c,l_m_c],[],2);
end