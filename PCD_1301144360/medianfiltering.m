function [X] = medianfiltering(I,D)
    X = zeros(size(I));
    for i = 1:3
        X(:,:,i) = medfilt2(double(I(:,:,i)), [D D]);
    end
    X = uint8(X);
end