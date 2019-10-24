function output = Promidpoint(img)
    [M, N] = size(img);
    output = zeros(M*2, N*2);
    for i=1:M
        for j=1:N
            output(i*2-1, j*2-1) = img(i,j);
        end
    end

    for i=1:M*2-1
        if(mod(i,2) == 0)
            output(i,:) = (output(i-1,:) + output(i+1,:)) ./ 2;
        end
    end

    for i=1:N*2-1
        if(mod(i,2) == 0)
            output(:,i) = (output(:,i-1) + output(:,i+1)) ./ 2;
        end
    end
    output = uint8(output);
end