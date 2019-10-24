function output = Myimhist( img )
    output=zeros(2,256);
    for i = 1:256
        output(1,i)=i-1;
        output(2,i)=size(find(img==i-1),1);
        
    end
end

