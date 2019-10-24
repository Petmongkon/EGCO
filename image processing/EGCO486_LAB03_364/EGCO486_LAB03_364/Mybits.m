function output = Mybits( img )

    b1=bitget(img,1)*(2^0);
    b2=bitget(img,2)*(2^1);
    b3=bitget(img,3)*(2^2);
    b4=bitget(img,4)*(2^3);
    b5=bitget(img,5)*(2^4);
    b6=bitget(img,6)*(2^5);
    b7=bitget(img,7)*(2^6);
    b8=bitget(img,8)*(2^7);
    
    output=uint8(b6+b7+b8);
    
    
    
end

