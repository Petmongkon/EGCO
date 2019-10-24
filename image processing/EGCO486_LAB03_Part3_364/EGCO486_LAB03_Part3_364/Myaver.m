function output = Myaver( img,extraSize )

    [m,n]=size(img);
    padImg = padarray(img,[extraSize,extraSize],0,'both');
    for i=2:m+1
        for j=2:n+1
            output(i-1,j-1)=round(padImg(i-1,j-1)/9)+round(padImg(i-1,j)/9)+round(padImg(i+1,j)/9)+round(padImg(i,j-1)/9)+round(padImg(i,j)/9)+round(padImg(i,j+1)/9)+round(padImg(i+1,j+1)/9)+round(padImg(i+1,j)/9)+round(padImg(i+1,j-1)/9);
        end
    end
    output=uint8(output);

end

