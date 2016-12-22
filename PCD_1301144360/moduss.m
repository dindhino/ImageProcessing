function G = moduss(I, n)

    [x y z] = size(I);
    x = x+n-1;
    y = y+n-1;
    temp = uint8(zeros([x y z]));

    temp(floor(n/2)+1 : end-floor(n/2) , floor(n/2)+1 : end-floor(n/2), :) = I; 
    G = uint8(zeros(size(I)));
    a = 1;
    b = 1;

    for i=floor(n/2)+1 : size(temp, 1)-floor(n/2)
        for j=floor(n/2)+1 : size(temp, 2)-floor(n/2)

            AR = reshape(temp(i-floor(n/2) : i+floor(n/2) ,j-floor(n/2) : j+floor(n/2) ,1), 1, n^2);
            AG = reshape(temp(i-floor(n/2) : i+floor(n/2) ,j-floor(n/2) : j+floor(n/2) ,2), 1, n^2);
            AB = reshape(temp(i-floor(n/2) : i+floor(n/2) ,j-floor(n/2) : j+floor(n/2) ,3), 1, n^2);

            mR = cariModus(AR);  
            mG = cariModus(AG); 
            mB = cariModus(AB);  
            
            G(a,b,1) = mR;
            G(a,b,2) = mG;
            G(a,b,3) = mB;
            b = b+1;
        end
        a = a+1;
        b = 1;
        
    end
%     G = G(floor(n/2)+1 : end-floor(n/2) , floor(n/2)+1 : end-floor(n/2), :);