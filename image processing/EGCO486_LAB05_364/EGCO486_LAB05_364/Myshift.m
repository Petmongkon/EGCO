function [ shiftImg ] = Myshift( img )
    [M,N]=size(img);
    shiftImg=zeros(M,N);
    for i=1:M
        for j=1:N
            if(i+M/2>M && j+N/2<=N)
                shiftImg(i,j)=img((i+M/2)-M,j+N/2);
            elseif(i+M/2<=M && j+N/2>N)
                shiftImg(i,j)=img(i+M/2,((j+N/2)-N));
            elseif(i+M/2>M && j+N/2>N)
                shiftImg(i,j)=img((i+M/2)-M,((j+N/2)-N));
            else
                shiftImg(i,j) = img(i+M/2,j+N/2);
            end
        end
    end

end

