function output = Myshear(img, sx, sy)
    [m,n,~] = size(img);
    output = zeros(size(img));

    for i=1:m
        for j=1:n
            xloc = round(j + i*sx);
            yloc = round(i + j*sy);
            if(xloc > 0 && yloc > 0 && yloc < m+1 && xloc < n+1)
                output(yloc, xloc,:) = img(i,j,:);
            end
        end
    end

    output = uint8(output);
end