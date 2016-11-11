function [OUT] = grayscale(I)
    gray = .299*I(:,:,1) + .587*I(:,:,2) + .144*I(:,:,3);
    OUT = uint8(gray);
end