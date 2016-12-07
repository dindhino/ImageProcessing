function [jpeg_result]=jpeg_compression(original,qf)
% Transform matrices
dct_matrix = dctmtx(8);
dct = @(X)dct_matrix * X * dct_matrix';
idct = @(X)dct_matrix' * X * dct_matrix;

% Quantization tables
q_max = 255;
q_y = ...
    [16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 q_c = ...
     [17 18 24 47 99 99 99 99;
      18 21 26 66 99 99 99 99;
      24 26 56 99 99 99 99 99;
      47 66 99 99 99 99 99 99;
      99 99 99 99 99 99 99 99;
      99 99 99 99 99 99 99 99;
      99 99 99 99 99 99 99 99;
      99 99 99 99 99 99 99 99];
  
%   Scale quantization matrices based on quality factor
% qf = 75;
if qf<50
    q_scale = floor(5000/qf);
else
    q_scale = 200-2*qf;
end
q_y = round(q_y*q_scale/100);
q_c = round(q_c*q_scale/100);

% RGB to YCbCr
ycc = rgb2ycbcr(im2double(original));

% Down-sample and decimate chroma
cb = conv2(ycc(:,:,2),[1 1;1 1])./4.0;
cr = conv2(ycc(:,:,3),[1 1;1 1])./4.0;
cb = cb(2:2:size(cb,1),2:2:size(cb,2));
cr = cr(2:2:size(cr,1),2:2:size(cr,2));
y = ycc(:,:,1);

% DCT, with scaling before quantization
y = blkproc(y,[8 8],dct).*q_max;
cb = blkproc(cb,[8 8],dct).*q_max;
cr = blkproc(cr,[8 8],dct).*q_max;

% Quantize DCT coefficients
y = blkproc(y,[8 8],@(block_struct)round(round(block_struct)./q_y));
cb = blkproc(cb,[8 8],@(block_struct)round(round(block_struct)./q_c));
cr = blkproc(cr,[8 8],@(block_struct)round(round(block_struct)./q_c));

% Dequantize DCT coefficients
y = blkproc(y,[8 8],@(block_struct)round(round(block_struct).*q_y));
cb = blkproc(cb,[8 8],@(block_struct)round(round(block_struct).*q_c));
cr = blkproc(cr,[8 8],@(block_struct)round(round(block_struct).*q_c));

% Inverse DCT
y = blkproc(y./q_max,[8 8],idct);
cb = blkproc(cb./q_max,[8 8],idct);
cr = blkproc(cr./q_max,[8 8],idct);

% Up-sample chroma
upsample_filter_1d = [1 3 3 1]/4;
upsample_filter = upsample_filter_1d'* upsample_filter_1d;

cb = conv2(upsample_filter,upsample(upsample(padarray(cb,[1 1],'replicate'),2)',2)');
cb = cb(4:size(cb,1)-4,4:size(cb,2)-4);

cr = conv2(upsample_filter,upsample(upsample(padarray(cr,[1 1],'replicate'),2)',2)');
cr = cr(4:size(cr,1)-4,4:size(cr,2)-4);

% Concatenate the channels
jpeg_result = ycbcr2rgb(cat(3,y,cb,cr));