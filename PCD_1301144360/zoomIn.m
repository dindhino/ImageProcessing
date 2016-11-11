function [Y] = zoomIn(I,x)
    a = round(x*size(I,1));
    b = round(x*size(I,2));
    Y = zeros(a, b, 3);
    m = 1; n = 1;
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            for k = 1 : round(x)-1
                for l = 1 : round(x)-1
                    Y(m,n,:) = I(i,j,:);
                    Y(m,n+l,:) = I(i,j,:);
                    Y(m+k,n,:) = I(i,j,:);
                    Y(m+k,n+l,:) = I(i,j,:);
                end
            end
            n = round(n+x);
        end
        m = round(m+x);
        n = 1;
    end
    Y = uint8(Y);
end