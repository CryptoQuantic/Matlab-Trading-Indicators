function WriteLineToFile(filename,data)
if exist(filename, 'file') == 2
    % File exists.
    dlmwrite(filename,data,'delimiter',',','-append');
else
    % File does not exist.
    dlmwrite(filename,data,'delimiter',',')
end
end