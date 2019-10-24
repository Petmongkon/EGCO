function [ output ] = Mydilate( img )
    img=im2bw(img);
    output=img;
    mask=[1,1,1;1,1,1;1,1,1];
    [m,n]=size(img);
    padImg=padarray(img,[1,1],0,'both');
    for i=2:m
        for j=2:n
            if(padImg(i,j)==1)
                if(padImg(i-1,j-1)+mask(1,1)>=1)
                    output(i-1,j-1)=1;
                end
                if(padImg(i,j-1)+mask(1,2)>=1)
                    output(i,j-1)=1;
                end 
                if(padImg(i+1,j-1)+mask(1,3)>=1)
                    output(i+1,j-1)=1;
                end
                if(padImg(i-1,j)+mask(2,1)>=1)
                    output(i-1,j)=1;
                end
                if(padImg(i,j)+mask(2,2)>=1)
                    output(i,j)=1;
                end
                if(padImg(i+1,j)+mask(2,3)>=1)
                    output(i+1,j)=1;
                end
                if(padImg(i-1,j+1)+mask(3,1)>=1)
                    output(i-1,j+1)=1;
                end
                if(padImg(i,j+1)+mask(3,2)>=1)
                    output(i,j+1)=1;
                end
                if(padImg(i+1,j+1)+mask(3,3)>=1)
                    output(i+1,j+1)=1;
                end
            end
        end
    end
%     output=im2bw(output);

end

