function imgRGB = pseudocolour(img)
% Ubah ke RGB
[p,q,r]=size(img);
for i=1:1:p
    for j=1:1:q
        if (img(i,j)>= 0) && (img(i,j)< 32)
            x(i,j,1)=5;
            x(i,j,2)=8;
            x(i,j,3)=45;
        elseif (img(i,j)>= 32) && (img(i,j)< 64)
            x(i,j,1)=27;
            x(i,j,2)=227;
            x(i,j,3)=38;
        elseif (img(i,j)>= 64) && (img(i,j)< 96)
            x(i,j,1)=128;
            x(i,j,2)=102;
            x(i,j,3)=255;
        elseif (img(i,j)>= 96) && (img(i,j)< 128)
            x(i,j,1)=200;
            x(i,j,2)=119;
            x(i,j,3)=189;
        elseif (img(i,j)>= 128) && (img(i,j)< 160)
            x(i,j,1)=37;
            x(i,j,2)=104;
            x(i,j,3)=237;    
        elseif (img(i,j)>= 160) && (img(i,j)< 192)
            x(i,j,1)=1;
            x(i,j,2)=70;
            x(i,j,3)=49;
        elseif (img(i,j)>= 192) && (img(i,j)< 224)
            x(i,j,1)=252;
            x(i,j,2)=224;
            x(i,j,3)=127;
        elseif (img(i,j)>= 224) && (img(i,j)< 255)
             x(i,j,1)=16;
            x(i,j,2)=180;
            x(i,j,3)=237;
        end
    end
end
imgRGB=x/255;