function loopUntillButtonPress()
% Create a figure window
fig = uifigure;
handles.endLoop = 0
% Create a push button
btn = uibutton(fig,'push',...
               'Position',[420, 218, 100, 22],...
               'ButtonPushedFcn', @(btn,event) endLoop(hObject, eventdata, handles));
j = 1;
while(~handles.endLoop)
    pause(1)
    j
    j = j+1;
end
% Create the function for the ButtonPushedFcn callback
function endLoop(hObject, eventdata, handles)
      handles.endLoop = 1;
      guidata(hObject, handles);
end
end

% 
% 
% functionpushbutton1_Callback(hObject, eventdata, handles)
% handles.stop_now = 0; %Create stop_now in the handles structure
% guidata(hObject,handles);  %Update the GUI data
% while ~(handles.stop_now)
%     yourfunction()
%     drawnow %Give the button callback a chance to interrupt the              %opening fucntion
%     handles = guidata(hObject);  %Get the newest GUI data
% end
% In the callback for the stop button you want
%     function pushbutton2_Callback(hObject, eventdata, handles)
%          handles.stop_now = 1;
%          guidata(hObject, handles); % Update handles structure