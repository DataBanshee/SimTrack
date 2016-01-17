function s = compareHists(h1,h2)


% Compares 2 normalized histograms using the Bhattacharyya coefficient.
% Assumes that sum(h1) == sum(h2) == 1

s = sum(sum(sum(sqrt(h1).*sqrt(h2))));
end

