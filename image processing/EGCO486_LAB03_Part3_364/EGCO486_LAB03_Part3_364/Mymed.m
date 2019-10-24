function  output  = Mymed( img,extraSize )
    
    padImg = padarray(img,[extraSize,extraSize],0,'both');
    [m,n]=size(img);
    
    for i=2:m+1
        for j=2:n+1
            value=[padImg(i-1,j-1),padImg(i-1,j),padImg(i+1,j),padImg(i,j-1),padImg(i,j),padImg(i,j+1),padImg(i+1,j+1),padImg(i+1,j),padImg(i+1,j-1)];
            output(i-1,j-1)=median(value);
        end
    end

end

