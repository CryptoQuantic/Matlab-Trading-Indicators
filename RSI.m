function rsi_out = rsi(data, N)

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

Adva = zeros(N,1);                  % initialize positive gain vector
Decl = zeros(N,1);                  % intiialize negative gain vector
% Use the first N samples to calculate the intitial RSI value
for i = 1:N
    chg = data(i+1) - data(i);      % find difference between days
    if chg >= 0                     % if positive change, it advanced
        Adva(i) = chg;              % save to variable
    else                            % if negative change, it declined
        Decl(i) = abs(chg);         % save to variable
    end     
end
AvgGain = mean(Adva);               % take mean of all price increases
AvgLoss = mean(Decl);               % take mean of all price decreases
if AvgLoss == 0                     % if average loss is 0, RSI is 100
    temp_rsi_out(1) = 100;                   % set RSI to 100
else
    RS = AvgGain / AvgLoss;         % calculate RS value
    temp_rsi_out(1) = 100 - (100/(1+RS));    % calculate intitial RSI value
end
clear Adva Decl                     % clear variables
% Now cycle through the rest of the data using the initial RSI value to
% calculate the remaining RSI values.
for i = (1+N):length(data)-1
    chg = data(i+1) - data(i);      % calculate change between days
    
    if chg >= 0                     % if positive change, it advanced
        Adva = chg;                 % assign change to advance variable
        Decl = 0;                   % set declined variable to 0
    else                            % if negative change, it declined
        Decl = abs(chg);            % assign change to declined variable
        Adva = 0;                   % set advanced variable to 0
    end
    AvgGain = ((AvgGain*(N-1))+Adva)/N;   % calculate next average gain
    AvgLoss = ((AvgLoss*(N-1))+Decl)/N;   % calculate next average loss
    
    if AvgLoss == 0                 % if average loss is 0, RSI = 100
        temp_rsi_out(i-N) = 100;             % set RSI to 100
    else
        RS = AvgGain / AvgLoss;     % calculate RS
        temp_rsi_out(i+1-N) = 100 - (100/(1+RS));    % calculate latest RSI
    end
    % Fill in the nan's
rsi_out(N+1:end) = temp_rsi_out(1:end-N);
end