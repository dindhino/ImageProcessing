function G = sobel(img, n)

% Ubah ke grayscale
img = rgb2gray(img);

% Ubah ke double
img = im2double(img);

% Konvolusi Sobel gx
gx = [-1,0,1; -2,0,2; -1,0,1;]
sobel_gx = conv2(img,gx,'same');

% Konvolusi Sobel gy
gy = [-1,-2,-1; 0,0,0; 1,2,1;]
sobel_gy = conv2(img,gy,'same');

% Konvolusi Sobel gabungan gx & gy
sobel_gab = sobel_gx + sobel_gy;

switch n
    case 1
        G = sobel_gab;
    case 2
        G = sobel_gx;
    otherwise
        G = sobel_gy;
end