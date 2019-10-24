function [ output ] = Procolorseg( img )

    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    
    I=R-(G/2)-(B/2);
    I=Mymed(I*0.888,1);
    mask=im2bw(I,0.3);
    
    BR=im2double(R).*double(mask);
    BG=im2double(B).*double(mask);
    BB=im2double(G).*double(mask);
    
    output=cat(3,BR,BG,BB);

end

