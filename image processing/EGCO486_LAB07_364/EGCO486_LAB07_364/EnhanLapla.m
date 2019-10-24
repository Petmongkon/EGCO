function [outputlapla] = EnhanLapla(img,extraSize)
    img=int16(img);
    [m,n]=size(img);
    padImg =int16(padarray(img,[extraSize,extraSize],0,'both'));
    
    mark =[-1 -1 -1 ;-1 9 -1 ; -1 -1 -1];
    for i =2:m+1
        for j=2:n+1
            outputlapla(i-1,j-1)=(padImg(i-1,j-1)*mark(3,3))+(padImg(i,j-1)*mark(3,2))+(padImg(i,j+1)*mark(3,1))+(padImg(i-1,j)*mark(2,3))+(padImg(i,j)*mark(2,2))+(padImg(i+1,j)*mark(2,1))+(padImg(i-1,j+1)*mark(1,3))+(padImg(i,j+1)*mark(1,2))+(padImg(i+1,j+1)*mark(1,1));
        end
    end
    
    outputlapla = uint8(outputlapla);
end