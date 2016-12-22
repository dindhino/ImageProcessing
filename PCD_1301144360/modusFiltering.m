function [X] = modusFiltering(I)
    X = zeros(size(I));
    for i = 1:(size(I,1))
        for j = 1:size(I,2)
            if ((i == 1) && (j == 1))
                A = I(1:2,1:2);
            elseif ((i == size(I,1)) && (j == size(I,2)))
                A = I(end-1:end,end-1:end);
            elseif (i == 1)
                A = I(1:2,j-1:j+1);
            elseif (j == 1)
                A = I(i-1:i+1,1:2);
            elseif (i == size(I,1))
                A = I(end-1:end,j-1:j+1);
            elseif (j == size(I,2))
                A = I(i-1:i+1,end-1:end);
            else
                A = I(i-1:i+1,j-1:j+1);
            end
            A = reshape(A,[1,size(A,1)*size(A,2)]);
            X(i,j) = mode(A);
        end
    end

end

