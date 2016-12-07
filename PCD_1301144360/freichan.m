function G = freichan(img, n)

% Ubah ke grayscale
img = rgb2gray(img);

% Ubah ke double
img = im2double(img);

% Konvolusi Frei-chan gx
gx = [-1,0,1; -2^(1/2),0,2^(1/2); -1,0,1;]
fc_gx = conv2(img,gx,'same');

% Konvolusi Frei-chan gy
gy = [-1,-2^(1/2),-1; 0,0,0; 1,2^(1/2),1;]
fc_gy = conv2(img,gy,'same');

% Konvolusi Frei-chan gabungan gx & gy
fc_gab = fc_gx + fc_gy;

switch n
    case 1
        G = fc_gab;
    case 2
        G = fc_gx;
    otherwise
        G = fc_gy;
end