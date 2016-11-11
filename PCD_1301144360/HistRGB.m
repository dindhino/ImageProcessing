function [OUT] = HistRGB(I)
    for i = 1:3
        I(:,:,i) = HistGray(I(:,:,i));
    end
    OUT = uint8(I);
end