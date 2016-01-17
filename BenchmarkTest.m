clear all, close all hidden
workinDir = 'Subway';%Tiger1 %MotorRolling
% Fill in with the name of the test sequence you chose:
% Available ones for this Benchmark:
%   - MountainBike
%   - MotorRolling
%   - Subway
%   - Tiger1
%   - Matrix
%   - Girl
%   - FaceOcc1
%   - Lemming
%   - Deer
imageNames = dir(fullfile(workinDir,'img','*.jpg'));
imageNames = {imageNames.name}';


for k = 1 : length(imageNames)
        %%%%%%%%%%%%% Display %%%%%%%%%%%%%%%
     I                = imread(fullfile(workinDir,'img',imageNames{k}));
    fig1              = figure(1);
    imshow(I);
    if k==1
        rect = getrect
        %h = imellipse(); %% Uncomment to select an Ellipse as a Region Of
                          %%Interest
        %vect = wait(h);
        %rect = getPosition(h);
        temp_im = imcrop(I,rect);
        last_window = temp_im;
        
    else
        
        window_detection = neighbor_check(I,rect,temp_im);
        
        
        rectangle('Position',window_detection,'EdgeColor','r','LineWidth',2)
        
        box_centroid(k,:) = rect2centroid(window_detection);
        hold on
        plot(box_centroid(k,1),box_centroid(k,2), '-m+')
        a=text(box_centroid(k,1)+15,box_centroid(k,2), strcat('X: ', num2str(round(box_centroid(k,1))), '    Y: ', num2str(round(box_centroid(k,2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        hold off
        rect= window_detection;
       
        % tim(last_window,imcrop(I,window_detection)); % Warning!! The TIM is
                                                       % not fully optimal
        last_window = imcrop(I,window_detection);
        %temp_im = imcrop(I,rect); % Uncomment to test template Update 
                                   % Not Recommended but Good Luck
    end
    
    
end


