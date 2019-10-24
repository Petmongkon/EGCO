function [ histRGB,histY,histI ] = Procolorhist( img )
    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    
    [histR]=uint8(Myhisteq(R));
    [histG]=uint8(Myhisteq(G));
    [histB]=uint8(Myhisteq(B));
    histRGB=cat(3,histR,histG,histB);
    [YCbCr,Y,Cb,Cr]=Myrgb2ycbcr(img);
    [Y]=Myhisteq(Y);
    histY=Mycbcr2yrgb(YCbCr,Y);
    [HSI,H,S,I]=Myrgb2hsi(img);
    I=uint8(I*255);
    [I]=Myhisteq(I);
    I=double(I/255);
    histI=Myhsi2rgb(HSI,I);
    
    
    
end

