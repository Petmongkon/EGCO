function [ output,output2 ] = Myclosing( img )

    output=Mydilate(img);
    output2=Myerosion(output);

end

