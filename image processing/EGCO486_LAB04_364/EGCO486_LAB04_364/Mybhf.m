function [ output ] = Mybhf( img,D0,n )

    [M,N]=size(img);
    img=fft2(img);
    shiftImg=Myshift(img);
    H=zeros(M,N);
    for i=1:M
        for j=1:N
            D = power(power(i - M/2, 2) + power(j - N/2, 2), 0.5);
            H(i, j) = 1/(1 + power(D0 / D, n*2));
        end
    end
    
    HV = shiftImg .* H ;
    HV = Myshift(HV);
    invertTranImg=ifft2(HV);
    output=uint8(invertTranImg);
    
   
end

