function CM = cariModus(x)
    m = zeros(size(x));
    for i =1 : size(x,2)
        m(i) = size(find(x==x(i)),2);
    end
    index = find(m==max(m));
    CM = x(index(1));
end
