function [ output ] = Myglf( img,D0 )

    [M,N]=size(img);
    padImg=padarray(img,[M,N],0,'post');
    shiftImg=fft2(padImg);
    shiftImg = Myshift(shiftImg);
    H=zeros(M*2,N*2);
    
    for i=1:M*2
        for j=1:N*2
            D = power(power(i - M, 2) + power(j - N, 2), 0.5);
            H(i, j) = exp((-1 * power(D, 2)) / (2 * power(D0, 2)));
        end
    end
    
    HV=H.*shiftImg;
    HV=Myshift(HV);
    invertTranImg=ifft2(HV);
    output=invertTranImg;
    output = output(7:236, 7:302);

end

