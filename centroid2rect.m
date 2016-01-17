function rectangle = centroid2rect(centroid,width,height)

% Returns a centroid from rectangle coordinates

rectangle = zeros(1,4);

rectangle(1) = centroid(1)-(0.5*width);
rectangle(2) = centroid(2)-(0.5*height);

rectangle(3) = width;
rectangle(4) = height;

end

