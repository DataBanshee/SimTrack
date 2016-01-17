%--------Code for Plain Object Detection-----------
% Load an image and select a template to detect in it
% The code can also do, with some minor modifications
% Image retrieval in a Datablase

%X = imread('UncleBens4.jpg');

filename = 'helico.png';%BensTest.png %helico.png
%[X,palette] = Qimage(filename,16);
X = imread(filename);
figure,
imshow(X);
im1 = rgb2hsv(double(X));
[nbRowsD,nbColD] = size(im1(:,:,1));

figure,
imshow(X);
rect=getrect;                           % select rectangle
I2=imcrop(X,rect);
figure
imshow(I2)
[nbRowsT,nbColT] = size(I2(:,:,1));

im2 = rgb2hsv(double(I2));


% Search Window
window = zeros(nbRowsT,nbColT);

bins = 8;
h2 = quantiHist(im2, bins);


M= zeros(nbRowsD-nbRowsT+1,nbColD-nbColT+1); % Intializing the Similarity Surface

for i=1:(nbRowsD-nbRowsT+1)
    for j=1:(nbColD-nbColT+1)
        window=im1(i:i+nbRowsT-1,j:j+nbColT-1,:);
        
        h1 = quantiHist(window, bins);
        M(i,j) = compareHists(h1,h2);
        
        
        
        sprintf('%d',i)
        
    end
    
    
end

[num idx] = max(M(:));
[i j] = ind2sub(size(M),idx);

diff_im = zeros(nbRowsD,nbColD);
diff_im(i:i+nbRowsT-1,j:j+nbColT-1,:)=1;

% Label all the connected components in the image.
bw = bwlabel(diff_im, 8);

% Here we do the image blob analysis.
% We get a set of properties for each labeled region.
stats = regionprops(bw, 'BoundingBox', 'Centroid');
figure,
imshow(imread(filename));

hold on

%This is a loop to bound the target in a rectangular box.
for object = 1:size(stats)
    bb = stats(object).BoundingBox;
    bc = stats(object).Centroid;
    rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
    plot(bc(1),bc(2), '-m+')
    a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
    set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
end

hold off