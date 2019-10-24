function output = Myimhist( img )
    output=zeros(2,512);
    for i = 1:512
        output(1,i)=i-1;
        output(2,i)=size(find(img==i-1),1);
    end
end

