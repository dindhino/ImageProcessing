function [IM] = konvolusi(I)
    Image = I;
    [x y z] = size(Image);
    Mask = randint(3,3,[-2 2])
    IM = uint8(zeros([x y z]));
    for h=1:z
        for i=2:x-1
            for j=2:y-1
                IM(i,j,h) = Image(i-1,j-1,h)*Mask(1,1) + Image(i-1,j,h)*Mask(1,2) + Image(i-1,j+1,h)*Mask(1,3) + Image(i,j-1,h)*Mask(2,1) + Image(i,j,h)*Mask(2,2) + Image(i,j+1,h)*Mask(2,3) + Image(i+1,j-1,h)*Mask(3,1) + Image(i+1,j,h)*Mask(3,2) + Image(i+1,j+1,h)*Mask(3,3);
            end;
        end;
    end;
    IM = uint8(IM);
end