function output = MyLaplaNeg(img,extraSize)

    [m,n]=size(img);
    padImg = int16(padarray(img,[extraSize,extraSize],0,'both'));
    
    mark =[0 1 0;1 -4 1; 0 1 0];
    
    for i =2:m+1
        for j=2:n+1
            output(i-1,j-1)=abs((mark(1,1)*padImg(i-1,j-1))+(mark(1,2)*padImg(i,j-1))+(mark(1,3)*padImg(i+1,j-1))+(mark(2,1)*padImg(i-1,j))+(mark(2,2)*padImg(i,j))+(mark(2,3)*padImg(i+1,j))+(mark(3,1)*padImg(i-1,j+1))+(mark(3,2)*padImg(i,j+1))+(mark(3,3)*padImg(i+1,j+1)));
        end
    end
end