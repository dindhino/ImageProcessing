function [Y] = zoomOut(I,x)
    Y = zeros(round(size(I,1)/x), round(size(I,2)/x), 3);
    m = 1; n = 1;
    for i = 1:size(Y,1)
        for j = 1:size(Y,2)
            Y(i,j,:) = I(m,n,:);
            n = round(n+x);
        end
        m = round(m+x);
        n = 1;
    end
    Y = uint8(Y);
end