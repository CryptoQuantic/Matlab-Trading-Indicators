function rsi_out = rsi(data, lag)

% See: https://www.macroption.com/rsi-calculation/


[l,w] = size(data);
%if row vector, convert to column
if(w==1) %is column vector
    nsamples = l;
else %is row vector
    data = data'
    nsamples = w;
end


rsi_out   = nan(nsamples,1); % intialize RSI vector 
temp_rsi_out = nan(nsamples,1);

UpMove = zeros(lag,1);                  
DownMove = zeros(lag,1);                 

% Calculate the intitial RSI 
for i = 1:lag
    chg = data(i+1) - data(i);      
    if chg >= 0                     
        UpMove(i) = chg;              
    else                           
        DownMove(i) = abs(chg);         
    end     
end
AvgGain = mean(UpMove);              
AvgLoss = mean(DownMove);              
if AvgLoss == 0                    
    temp_rsi_out(1) = 100;                  
else
    RS = AvgGain / AvgLoss;         
    temp_rsi_out(1) = 100 - (100/(1+RS));    % calculate intitial RSI value
end
clear UpMove DownMove                     


%Calculate full rsi series
for i = (1+lag):length(data)-1
    chg = data(i+1) - data(i);      
    
    if chg >= 0                     
        UpMove = chg;                
        DownMove = 0;                   
    else                            
        DownMove = abs(chg);           
        UpMove = 0;                  
    end
    AvgGain = ((AvgGain*(lag-1))+UpMove)/lag;   
    AvgLoss = ((AvgLoss*(lag-1))+DownMove)/lag;   
    
    if AvgLoss == 0                 
        temp_rsi_out(i-lag) = 100;             
    else
        RS = AvgGain / AvgLoss;    
        temp_rsi_out(i+1-lag) = 100 - (100/(1+RS));    
    end
    
    % Fill in the nan's
end
rsi_out(lag+1:end) = temp_rsi_out(1:end-lag);
end