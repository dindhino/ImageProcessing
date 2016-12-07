function G = segmen(I,n)

% Bikin matriks zero
putih = uint8(zeros(size(I)));
biru = uint8(zeros(size(I)));
kuning = uint8(zeros(size(I)));
merah = uint8(zeros(size(I)));

% Ambil warnanya
for i = 1:size(I,1)
    for j = 1:size(I,2)
        if ((I(i,j,1) <= 75) && (I(i,j,2) <= 115) && (I(i,j,3) >= 140))
            biru(i,j,:) = I(i,j,:);
        end
        if ((I(i,j,1) >= 130) && (I(i,j,2) <= 80) && (I(i,j,3) <= 80))
            merah(i,j,:) = I(i,j,:);
        end
        if ((I(i,j,1) >= 200) && (I(i,j,2) >= 150) && (I(i,j,2) <= 190) && (I(i,j,3) >= 50) && (I(i,j,3) <= 90))
            kuning(i,j,:) = I(i,j,:);
        end
        if ((I(i,j,1) >= 210) && (I(i,j,2) >= 210) && (I(i,j,3) >= 210))
            putih(i,j,:) = I(i,j,:);
        end
    end
end

switch n
    case 1
        G = putih;
    case 2
        G = biru;
    case 3
        G = kuning;
    otherwise
        G = merah;
end