function [ RGB ] = Mycbcr2yrgb( img,Y )
   
    img=double(img);
%     Y=(img(:,:,1));
    Y=double(Y);
    Cb=(img(:,:,2));
    Cr=(img(:,:,3));
    
    y=(Y./255);
    cb=(Cb./255);
    cr=(Cr./255);
    
    R = uint8((y + 1.403*(cr-0.5)) * 255);
    G = uint8((y - 0.344*(cb-0.5)-0.714*(cr-0.5)) * 255);
    B = uint8((y + 1.773*(cb-0.5)) * 255);
    
    RGB=cat(3,R,G,B);
 
end

