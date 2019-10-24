function [ laplaRGB,laplaY,laplaI ] = Procolorsharpen( img )

    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    
    R=EnhanLapla(R,1);
    G=EnhanLapla(G,1);
    B=EnhanLapla(B,1);
    
    laplaRGB=cat(3,R,G,B);

    [YCbCr,Y,Cb,Cr]=Myrgb2ycbcr(img);
    Y=EnhanLapla(Y,1);
    laplaY=Mycbcr2yrgb(YCbCr,Y);
    
    [HSI,H,S,I]=Myrgb2hsi(img);
    I=uint8(I*255);
    [I]=EnhanLapla(I,1);
    I=double(I);
    laplaI=Myhsi2rgb(HSI,I/255);

end

