function [new_rectangle] = neighbor_check(frame,rect,temp_im)

xmin=rect(1);
ymin=rect(2);
width=round(rect(3));
height=round(rect(4));

step_x = 0.5*width;
step_y = 0.5*height;

% Compute the centroid

%[centroid_x centroid_y] = [xmin+step_x ymin-step_y];

centroid = zeros(9,2);

centroid(1,:)= rect2centroid([xmin ymin width height]);
centroid(2,:)= [centroid(1,1)+step_x centroid(1,2)];
centroid(3,:)= [centroid(1,1)-step_x centroid(1,2)];

centroid(4,:)= [centroid(1,1) centroid(1,2)+step_y];
centroid(5,:)= [centroid(4,1)+step_x centroid(4,2)];
centroid(6,:)= [centroid(4,1)-step_x centroid(4,2)];

centroid(7,:)= [centroid(1,1) centroid(1,2)-step_y];
centroid(8,:)= [centroid(7,1)+step_x centroid(7,2)];
centroid(9,:)= [centroid(7,1)-step_x centroid(7,2)];



bins = 8;

rectangle = centroid2rect(centroid(1,:),width,height);
%template = rgb2hsv(double(temp_im)); % Uncomment for HSV testing
template = (double(temp_im));
h2 = quantiHist(template, bins);



% Condensed One Pebble Hundred Ripples

for i =1:size(centroid,1)
    
    rectangle = centroid2rect(centroid(i,:),width,height);
    %window = rgb2hsv(double(imcrop(frame,rectangle)));
    window = (double(imcrop(frame,rectangle)));
    
    if size(window,1)< height+1 || size(window,2)< width+1
        window = padarray(window,[(height+1)-size(window,1) (width+1)-size(window,2)],'post');
    end
    
    h1 = quantiHist(window, bins);
    
    
    if size(h1,2)<size(h2,2)
        h1 = padarray(h1,[0 size(h2,2)-size(h1,2)],'post');
    end
    
    M(i) = compareHists(h1,h2);
    
   
    
end


if max(M) < 0.5
    centroid(10,:) = [centroid(1,1)+2*step_x centroid(1,2)];
    centroid(11,:) = [centroid(1,1)-2*step_x centroid(1,2)];
    
    centroid(12,:)= [centroid(4,1)+2*step_x centroid(4,2)];
    centroid(13,:)= [centroid(4,1)-2*step_x centroid(4,2)];
    
    centroid(14,:)= [centroid(7,1)+2*step_x centroid(7,2)];
    centroid(15,:)= [centroid(7,1)-2*step_x centroid(7,2)];
    
    centroid(16,:)= [centroid(10,1)+1*step_x centroid(10,2)];
    centroid(17,:)= [centroid(10,1)-5*step_x centroid(10,2)];
    
    % Extensive Research 
    for i =size(centroid,1)-7:size(centroid,1)
        
        rectangle = centroid2rect(centroid(i,:),width,height);
        %window = rgb2hsv(double(imcrop(frame,rectangle))); % Uncomment to
                                                            % enable HSV Processing
        window = (double(imcrop(frame,rectangle)));
        
        if size(window,1)< height+1 || size(window,2)< width+1
            window = padarray(window,[(height+1)-size(window,1) (width+1)-size(window,2)],'post');
        end
        
        h1 = quantiHist(window, bins);
        
        
        if size(h1,2)<size(h2,2)
            h1 = padarray(h1,[0 size(h2,2)-size(h1,2)],'post');
        end
        
        M(i) = compareHists(h1,h2);

        
        
    end
    
end


[num idx] = max(M);


new_rectangle = centroid2rect(centroid(idx,:),width,height);







end