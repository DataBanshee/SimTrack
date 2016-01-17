function h = quantiHist(image, bins)


% Output = 1D histogram vector, h
%
%   size(h) ==> (bins^D)x(1)

if (nargin <= 1)
   bins = 8;
end


z = size(image,3);
image2 = zeros(size(image,1),size(image,2));

f = 1;
for i = 1:z
   image2 = image2 + f*floor(image(:,:,i)*bins/256); %normalizing
   f=f*bins;
end

h = hist(makelinear(image2), 0:(f-1));
h = h / sum(h); %

end
