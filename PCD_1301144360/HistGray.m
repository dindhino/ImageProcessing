function [OUT] = HistGray(I)
    X = imhist(I);
    HisteqManual = zeros(size(X));
    for i = 1:256
        jum = 0;
        Y(i) = X(i)/sum(X);
        for j = 1:i
            jum = jum + Y(j);
        end
        HisteqManual(i) = round(255*jum);
    end
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            I(i,j) = HisteqManual(I(i,j)+1);
        end
    end
    OUT = uint8(I);
end