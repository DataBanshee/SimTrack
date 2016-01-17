clear all, close all hidden
video_file        = 'VideoBens.wmv';%VideoBens.wmv %SECOND.avi %Bolt.mp4
video = mmread(video_file); % Warning!!! You need to mex the files before using mmread or replace it with aviread
                            % depending on your Matlab Version
                            % Code tested on Matlab2010a
offset_frame      = 80;%80
nb_frame = video.nrFramesTotal - offset_frame - 10; 
dim_x = video.width; 
dim_y = video.height;

I                 = video.frames(offset_frame + 1).cdata; 

for k = 1 : nb_frame
        %%%%%%%%%%%%% Display %%%%%%%%%%%%%%%
     I                = video.frames(offset_frame + k).cdata;
    fig1              = figure(1);
    image(I);
    if k==1
        rect = getrect
        %h = imellipse();   % Uncomment to use ellipse intead of rectangle
        %vect = wait(h);
        %rect = getPosition(h);
        temp_im = imcrop(I,rect);
        
    else
        window_detection = neighbor_check(I,rect,temp_im);
        %rectangle('Position',window_detection,'Curvature',[1,1],'EdgeColor
        %','r','LineWidth',2) % For ellipse processing
        rectangle('Position',window_detection,'EdgeColor','r','LineWidth',2)
        box_centroid(k,:) = rect2centroid(window_detection);
        hold on
        plot(box_centroid(k,1),box_centroid(k,2), '-m+')
        a=text(box_centroid(k,1)+15,box_centroid(k,2), strcat('X: ', num2str(round(box_centroid(k,1))), '    Y: ', num2str(round(box_centroid(k,2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        hold off
        rect= window_detection;
        %temp_im = imcrop(I,rect); % Uncomment to enable template update
    end
    
end
