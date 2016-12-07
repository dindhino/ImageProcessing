function G = prewit2(img, n)

% Ubah ke grayscale
img = rgb2gray(img);

% Ubah ke double
img = im2double(img);

% Konvolusi Prewitt2 N
pN = [-1,-1,-1; 1,-2,1; 1,1,1;]
p_N = conv2(img,pN,'same');

% Konvolusi Prewitt2 NW
pNW = [-1,-1,1; -1,-2,1; 1,1,1;]
p_NW = conv2(img,pNW,'same');

% Konvolusi Prewitt2 W
pW = [-1,1,1; -1,-2,1; -1,1,1;]
p_W = conv2(img,pW,'same');

% Konvolusi Prewitt2 SW
pSW = [1,1,1; -1,-2,1; -1,-1,1;]
p_SW = conv2(img,pSW,'same');

% Konvolusi Prewitt2 S
pS = [1,1,1; 1,-2,1; -1,-1,-1;]
p_S = conv2(img,pS,'same');

% Konvolusi Prewitt2 SE
pSE = [1,1,1; 1,-2,-1; 1,-1,-1;]
p_SE = conv2(img,pSE,'same');

% Konvolusi Prewitt2 E
pE = [1,1,-1; 1,-2,-1; 1,1,-1;]
p_E = conv2(img,pE,'same');

% Konvolusi Prewitt2 NE
pNE = [1,-1,-1; 1,-2,-1; 1,1,1;]
p_NE = conv2(img,pNE,'same');

% Konvolusi Prewitt2 Gabungan
p_Gab = p_N + p_NE + p_E + p_SE + p_SW + p_W +p_NW;

switch n
    case 1
        G = p_Gab;
    case 2
        G = p_N;
    case 3
        G = p_NW;
    case 4
        G = p_W;
    case 5
        G = p_SW;
    case 6
        G = p_S;
    case 7
        G = p_SE;
    case 8
        G = p_E;
    otherwise
        G = p_NE;
end