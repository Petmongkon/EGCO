function [output] = Mytemcorr(img,tem)
    
    img=double(img);
    tem=double(tem);
    [m1,n1]=size(img);
    [m2,n2]=size(tem);
    
    diff=ones(m1,n1);
    for i=1:m1-m2
        for j=1:n1-n2
            diff(i,j) = sum(sum(abs(img(i:i+m2-1,j:j+n2-1)-tem)));
        end
    end

    output=img;
    for i=1:m1
        for j=1:n1
            if diff(i,j)==0
                output(i:i+m2-1,j) = 255;
                output(i:i+m2-1,j+n2-1) = 255;
                output(i,j:j+n2-1) = 255;
                output(i+m2-1,j:j+n2-1) = 255;
            end
        end
    end
end

