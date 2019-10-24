function output = Mygrayls( img,c,a,b )

[m n]=size(img)
for i=1:m
    for j=1:n
        if(img(i,j)>=a && img(i,j)<=b)
            output(i,j)=255;
        else
            if(c==1)
                output(i,j)=0;
            else
                output(i,j)=img(i,j);
            end
        end
    end
end

    


end

