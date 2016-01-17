function flag = tim(currentFrame,lastFrame)

% TIM : Template Inverse Matching to detect Tracking Loss
% Warning: This version is still under work and seriously
% needs to be optimized

bins = 8;
height = max(size(currentFrame,1),size(lastFrame,1));
width = max(size(currentFrame,2),size(lastFrame,2));

if size(currentFrame,1)< height+1 || size(currentFrame,2)< width+1
       windowC = currentFrame;
       windowC = padarray(windowC,[(height+1)-size(windowC,1) (width+1)-size(windowC,2)],'post');
end
   
if size(lastFrame,1)< height+1 || size(lastFrame,2)< width+1 
       windowL = lastFrame;
       windowL = padarray(windowL,[(height+1)-size(windowL,1) (width+1)-size(windowL,2)],'post');
 end
hCurrent = getPatchHist(double(currentFrame), bins);

hLast = getPatchHist(double(lastFrame), bins);

if size(hCurrent,2)<size(hLast,2)
       hCurrent = padarray(hCurrent,[0 size(hLast,2)-size(hCurrent,2)],'post');
end
   
if compareHists(hCurrent,hLast)< 0.2
    sprintf('Tracking Loss Detected');
end


flag = 0;





end