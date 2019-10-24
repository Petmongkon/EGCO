function [ YCbCr,Y,Cb,Cr ] = Myrgb2ycbcr( img )
    img=double(img);
    R=(img(:,:,1));
    G=(img(:,:,2));
    B=(img(:,:,3));
    
    r=(R./255);
    g=(G./255);
    b=(B./255);
    
    y=(0.299*r)+(0.578*g)+(0.114*b);
    cb=(0.564*(b-y))+0.5;
    cr=(0.713*(r-y))+0.5;
    
    Y=uint8(y.*255);
    Cb=uint8(cb.*255);
    Cr=uint8(cr.*255);
    
    YCbCr=cat(3,Y,Cb,Cr);
    YCbCr=uint8(YCbCr);
end

