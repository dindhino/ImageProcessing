function [Y] = sampling(I,x)
    Y = I;
    for i = 1:size(I,1)
        for j = 1:x:size(I,2)
            for l = 0:x-1
                Y(i+l,j+l,:) = I(i,j,:);
                Y(i+l,j+l+1,:) = I(i,j,:);
                Y(i+l+1,j+l,:) = I(i,j,:);
                Y(i+l+1,j+l+1,:) = I(i,j,:);
            end
        end
    end
end