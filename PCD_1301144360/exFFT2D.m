function exFFT2D(I)

%close all
% load image
g = I;
g= rgb2gray(g);
%tampilkan image asal
figure %1
subplot(2,4,1);imshow(g);title('Gambar Asli');

%lakukan fft & shift hasilnya
fft_g = fft2(g);
fs = fftshift(fft_g);

%tampilkan image hasil fft
%2
subplot(2,4,2);imshow(log(abs(fft_g)),[]);title('Hasil FFT');

%kembalikan hasilnya ke image asal
balik = ifft2(fft_g);
%3
subplot(2,4,3);imshow(uint8(balik));title('Hasil Balik dari FFT');

% -----------------------------------
%coba lihat apa yang terjadi jika hasil fft dimodifikasi

fs1 = fs;
fs1(150:250,150:250) = 0;
%tampilkan image hasil fft
%4
subplot(2,4,4);imshow(log(abs(fs1)),[]);title('Modifikasi FFT');

%kembalikan hasilnya ke image asal
balik = ifft2(ifftshift(fs1));
%5
subplot(2,4,5);imshow(uint8(balik));title('Hasil Balik dari FFT Modifikasi');

mask = zeros(size(g));
mask(150:250,150:250) = 1;

hasil = mask.*fs;
%tampilkan image hasil fft
%6
subplot(2,4,6);imshow(log(abs(hasil)),[]);title('Hasil Crop FFT');

%kembalikan hasilnya ke image asal
balik = ifft2(ifftshift(hasil));
%7
subplot(2,4,7);imshow(uint8(balik));title('Hasil Balikan Crop FFT');