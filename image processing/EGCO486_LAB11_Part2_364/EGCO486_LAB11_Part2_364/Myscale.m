function output = Myscale(img, Sx, Sy)
    [m,n,~] = size(img);
    output = zeros(size(img));


    for i=1:m
        for j=1:n
            xloc = ceil(j/Sx);
            yloc = ceil(i/Sy);
            if(xloc > 0 && yloc > 0 && yloc < m+1 && xloc < n+1)
                output(i, j,:) = img(yloc,xloc,:);
            end
        end
    end

    output = uint8(output);
end