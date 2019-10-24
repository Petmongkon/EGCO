function output = Pronearest(img, scale)
    [m, n] = size(img);
    output = zeros(scale);
    for i=1:scale(1)
        for j=1:scale(2)
            ii = round( (i-1)*(n-1)/(scale(1))+1 );
            jj = round( (j-1)*(m-1)/(scale(2))+1 );
            output(i,j) = img(ii, jj);
        end
    end
end