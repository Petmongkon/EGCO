function output = Propointsam(img)
    [M, N] = size(img);
    output = zeros(M/2, N/2);
    for i=1:M/2
        for j=1:N/2
            output(i,j) = img(i*2-1,j*2-1);
        end
    end
    output = uint8(output);
end