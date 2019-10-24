function [ medRGB,medY,medI ] = Procolormedian( img )

    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    
    R=Mymed(R,1);
    G=Mymed(G,1);
    B=Mymed(B,1);
    
    medRGB=cat(3,R,G,B);
    
    [YCbCr,Y,Cb,Cr]=Myrgb2ycbcr(img);
    Y=Mymed(Y,1);
    medY=Mycbcr2yrgb(YCbCr,Y);
    [HSI,H,S,I]=Myrgb2hsi(img);
    I=uint8(I*255);
    [I]=Mymed(I,1);
    I=double(I);
    medI=Myhsi2rgb(HSI,I/255);
end

