function [A] = warping(I)
    tform = maketform('affine', [1 0 0; .5 1 0; 0 0 1]);
    A = imtransform(I, tform);
end