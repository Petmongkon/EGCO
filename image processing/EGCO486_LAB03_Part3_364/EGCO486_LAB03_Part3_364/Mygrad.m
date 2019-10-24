function  [output,HrOutput,HcOutput]  = Mygrad( img,extraSize )

    [m,n]=size(img);
    padImg = int16(padarray(img,[extraSize,extraSize],0,'both'));
    
    Hr=[1 1 1; 0 0 0; -1 -1 -1];
    Hc=[1 0 -1; 1 0 -1; 1 0 -1];
    
    for i=2:m+1
        for j=2:n+1
            HrOutput(i-1,j-1)=abs((Hr(1,1)*padImg(i-1,j-1))+(Hr(1,2)*padImg(i,j-1))+(Hr(1,3)*padImg(i+1,j-1))+(Hr(2,1)*padImg(i-1,j))+(Hr(2,2)*padImg(i,j))+(Hr(2,3)*padImg(i+1,j))+(Hr(3,1)*padImg(i-1,j+1))+(Hr(3,2)*padImg(i,j+1))+(Hr(3,3)*padImg(i+1,j+1)));
        
            HcOutput(i-1,j-1)=abs((Hc(1,1)*padImg(i-1,j-1))+(Hc(1,2)*padImg(i,j-1))+(Hc(1,3)*padImg(i+1,j-1))+(Hc(2,1)*padImg(i-1,j))+(Hc(2,2)*padImg(i,j))+(Hc(2,3)*padImg(i+1,j))+(Hc(3,1)*padImg(i-1,j+1))+(Hc(3,2)*padImg(i,j+1))+(Hc(3,3)*padImg(i+1,j+1)));
           
            output(i-1,j-1)=HrOutput(i-1,j-1)+HcOutput(i-1,j-1);
        end
    end
    HrOutput=int16(HrOutput);
    output=int16(output);
    HcOutput=int16(HcOutput);


end

