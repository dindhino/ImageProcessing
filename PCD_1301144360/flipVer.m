function [Y] = flipVer(I)
    x = size(I);
    Y = I;
    k = x(1);
    for i = 1:x(1)
        for j = 1:x(2)
            Y(k,j,:) = I(i,j,:);
        end
        k = k-1;
    end
end

