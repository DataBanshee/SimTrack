function centroid = rect2centroid(rectangle)

% Returns a rectangle coordinates from its centroid
centroid = zeros(1,2);

step_x = 0.5*rectangle(3);
step_y = 0.5*rectangle(4);

% Compute the centroid

centroid = [rectangle(1)+step_x rectangle(2)+step_y];


end
