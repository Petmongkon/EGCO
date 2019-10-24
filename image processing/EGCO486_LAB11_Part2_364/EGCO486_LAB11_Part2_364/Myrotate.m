function output = Myrotate(img, degree)
    [m,n,~] = size(img);
    output = zeros(size(img));

    for i=1:m
        for j=1:n
            xloc = round(j*cosd(degree) + i*sind(degree));
            yloc = round(i*cosd(degree) - j*sind(degree));
            if(xloc > 0 && yloc > 0 && yloc < m+1 && xloc < n+1)
                output(i, j,:) = img(yloc,xloc,:);
            end
        end
    end

    output = uint8(output);
end