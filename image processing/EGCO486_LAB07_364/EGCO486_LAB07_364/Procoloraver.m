function [ averRGB,averY,averI ] = Procoloraver( img )
    
    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    
    R=Myaver(R,1);
    G=Myaver(G,1);
    B=Myaver(B,1);
    
    averRGB=cat(3,R,G,B);
    
    [YCbCr,Y,Cb,Cr]=Myrgb2ycbcr(img);
    Y=Myaver(Y,1);
    averY=Mycbcr2yrgb(YCbCr,Y);
    [HSI,H,S,I]=Myrgb2hsi(img);
    I=uint8(I*255);
    [I]=Myaver(I,1);
    I=double(I);
    averI=Myhsi2rgb(HSI,I);

end

