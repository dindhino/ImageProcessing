function [Y] = rotate90(I)
    x = size(I);
    Y = zeros(x(2), x(1), 3);
    k = x(1);
    for i = 1:x(1)
        for j = 1:x(2)
            Y(j,k,:) = I(i,j,:);
        end
        k = k-1;
    end
    Y = uint8(Y);
end

