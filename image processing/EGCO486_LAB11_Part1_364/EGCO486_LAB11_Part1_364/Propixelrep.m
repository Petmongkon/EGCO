function output = Propixelrep(img)
    [M, N] = size(img);
    output = zeros(M*2, N*2);
    for i=1:M
        for j=1:N
            output(i*2-1:i*2, j*2-1:j*2) = img(i,j);
        end
    end
    output = uint8(output);
end