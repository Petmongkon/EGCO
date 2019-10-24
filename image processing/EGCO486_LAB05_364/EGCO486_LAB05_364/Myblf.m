function [ output ] = Myblf( img ,D0 ,n )
    
    [M,N]=size(img);
    shiftImg=fft2(img);
    shiftImg=Myshift(shiftImg);
%     img=Myshift(img);
%     shiftImg=fft2(img);
    H=zeros(M,N);
    
    for i=1:M
        for j=1:N
            D = power(power(i - M/2, 2) + power(j - N/2, 2), 0.5);
            H(i, j) = 1/(1 + power(D / D0, n*2));
        end
    end
    
    HV=H.*shiftImg;
%     HV=ifft2(HV);
%     invertTranImg=Myshift(HV);
    HV=Myshift(HV);
    invertTranImg=ifft2(HV);
    output=invertTranImg;
    
end

