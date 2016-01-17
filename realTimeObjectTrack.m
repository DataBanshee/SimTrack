clear all;
a = imaqhwinfo;
[camera_name, camera_id, format] = getCameraInfo(a);


% Capture the video frames using the videoinput function
% You have to replace the resolution & your installed adaptor name.
vid = videoinput(camera_name, camera_id, format);

% Set the properties of the video object
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb')
vid.FrameGrabInterval = 5;
k = 1;
global rect;
%temp_im = double(imread('tired_face.png'));
%start the video acquisition
start(vid)



% Set a loop
while(vid.FramesAcquired<=200)
    
    % Get the snapshot of the current frame
    data = (getsnapshot(vid));
    

    I = data;
    imagehandle = imshow(I);
    set(imagehandle,'ButtonDownFcn',@btnDrawNewMask_Callback);
    %rect
    if k ==5
        
        pause(7);
        load('rectangle.mat');
        rect = [xmin ymin width height];
        temp_im = imcrop(I,rect);
        
        imshow(temp_im);
        
        delete('rectangle.mat')
    elseif k>5
        
        window_detection = neighbor_check(I,rect,temp_im);
        rectangle('Position',window_detection,'EdgeColor','r','LineWidth',2)
        box_centroid(k,:) = rect2centroid(window_detection);
        hold on
        plot(box_centroid(k,1),box_centroid(k,2), '-m+')
        a=text(box_centroid(k,1)+15,box_centroid(k,2), strcat('X: ', num2str(round(box_centroid(k,1))), '    Y: ', num2str(round(box_centroid(k,2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        hold off
        rect= window_detection;
        %temp_im = imcrop(I,rect);
        k = k + 1;
    end
    
    k=k+1;
end
% Both the loops end here.

% Stop the video aquisition.
stop(vid);

% Flush all the image data stored in the memory buffer.
flushdata(vid);

% Clear all variables
clear all


