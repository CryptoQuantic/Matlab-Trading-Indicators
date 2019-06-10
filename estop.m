function estop()
%orderId = IBMatlab('action','close','Exchange','GLOBEX','symbol','mes','secType','FUT','localsymbol','mesm9','type','MKT');
%pause(1);
data = IBMatlab('action','CANCEL');