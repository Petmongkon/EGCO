function output = Prolocalaver(img)
    [M, N] = size(img);
    output = zeros(M/2, N/2);
    for i=1:M/2
        for j=1:N/2
            local = reshape(img(i*2-1:i*2, j*2-1:j*2), [1,4]);
            output(i,j) = sum(double(local) ./ 4);
        end
    end
    output = uint8(output);
end