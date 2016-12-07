function [Y] = flipHor(I)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    x = size(I);
    Y = I;
    for i = 1:x(1)
        k = x(2);
        for j = 1:x(2)
            Y(i,k,:) = I(i,j,:);
            k = k-1;
        end
    end
end