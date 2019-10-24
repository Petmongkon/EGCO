function output = Mytranslate(img, Tx, Ty)
    [m,n,~] = size(img);
    output = zeros(size(img));

    for i=1:m
        for j=1:n
            xn=i-Tx;
            yn=j-Ty;
            
%             xloc = j - Tx;
%             yloc = i - Ty;
%             if(xloc > 0 && yloc > 0 && yloc < m+1 && xloc < n+1)
%                 output(i, j,:) = img(yloc,xloc,:);
%             end
        end
    end

    output = uint8(output);
end