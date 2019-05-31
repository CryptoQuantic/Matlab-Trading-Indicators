function estop()
orderId = IBMatlab('action','sell', 'quantity',1,'Exchange','GLOBEX','symbol','mes','secType','FUT','localsymbol','mesm9','type','MKT');
pause(1);
data = IBMatlab('action','CANCEL');