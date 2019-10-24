function [ output,output2 ] = Myopening( img )
    
    output=Myerosion(img);
    output2=Mydilate(output);

end

