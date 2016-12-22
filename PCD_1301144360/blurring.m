function [OUT] = blurring(I)
    [x y z] = size(I);

    %untuk mengatur tingkat blur/buram
    blurVal = 10;

    %lakukan pembacaan pixel sebesar dimensi gambar
    for i=1:x
        posisi = 1;
        for j=1:y
            
            %mengambil warna 
            if (posisi == 1)
               wrnRed = I(i,j,1);
               wrnGreen = I(i,j,2);
               wrnBlue = I(i,j,3);
            end
            
            %manipulasi warna dimensi/matrix
            img(i,j,1) = wrnRed;
            img(i,j,2) = wrnGreen;
            img(i,j,3) = wrnBlue;
            
            posisi = posisi + 1; 
            if(posisi > blurVal)
                posisi = 1;
            end    
        end
    end
    OUT = uint8(img);
end