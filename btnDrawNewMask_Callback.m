% --- Executes on button press in btnDrawNewMask.
% Allows user to draw a polygon over image and then save the coordinates in a binary data file.
% (We could just as well use a mat format file.)
function btnDrawNewMask_Callback(hObject,eventdata)
% hObject    handle to btnDrawNewMask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Declare our global variables in case they want to save them to a mat file.
global rect;
flag = 1;


% Prompt user to draw a region on the image.
%uiwait(msgbox({'Draw a polygon over the image.' 'Right click the last vertex point to finish drawing.'}));
handles = guidata(hObject);
% Erase all previous lines.
ClearLinesFromAxes(handles);

% Get binary image that is a mask representing the region they drew.
% binaryMask is an image of Logical data type.
%[binaryMask xCoords yCoords] = roipolyold;   % drop the binaryMask= and ; to see the binary image mask
%     imshow(binaryMask);

rect = getrect()
xmin = rect(1);
ymin = rect(2);
width = rect(3);
height = rect(4);
%flag = 1;

%save('FLAG.mat','flag');
%load('FLAG.mat');


save('rectangle.mat','xmin','ymin','width','height');

% Plot the mask as an outline over the image.
hold on;
rectangle('Position',rect,'EdgeColor','r','LineWidth',2)
load('rectangle.mat');
rect = [xmin ymin width height];
%temp_im = imcrop(I,rect);
%k=k+1;
%delete('rectangle.mat')
return;
end



 