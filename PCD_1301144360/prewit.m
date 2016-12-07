function G = prewit(img, n)

% Ubah ke grayscale
img = rgb2gray(img);

% Ubah ke double
img = im2double(img);

% Konvolusi Prewitt gx
gx = [-1,0,1; -1,0,1; -1,0,1;]
prewitt_gx = conv2(img,gx,'same');

% Konvolusi Prewitt gy
gy = [-1,-1,-1; 0,0,0; 1,1,1;]
prewitt_gy = conv2(img,gy,'same');

% Konvolusi Prewitt gabungan gx & gy
prewitt_gab = prewitt_gx + prewitt_gy;

switch n
    case 1
        G = prewitt_gab;
    case 2
        G = prewitt_gx;
    otherwise
        G = prewitt_gy;
end