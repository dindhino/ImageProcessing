function G = robert(img, n)

% Ubah ke grayscale
img = rgb2gray(img);

% Ubah ke double
img = im2double(img);

% Konvolusi Robert d1
d1 = [-1,0,0; 0,1,0; 0,0,0;]
roberts_d1 = conv2(img,d1,'same');

% Konvolusi Robert d2
d2 = [0,0,-1; 0,1,0; 0,0,0;]
roberts_d2 = conv2(img,d2,'same');

% Konvolusi Robert gabungan d1 & d2
roberts_gab = roberts_d1 + roberts_d2;

switch n
    case 1
        G = roberts_gab;
    case 2
        G = roberts_d1;
    otherwise
        G = roberts_d2;
end