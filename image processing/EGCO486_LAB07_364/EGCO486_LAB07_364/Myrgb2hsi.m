function [ HSI,H,S,I ] = Myrgb2hsi( img )
    img=double(img);
    R=img(:,:,1)./255;
    G=img(:,:,2)./255;
    B=img(:,:,3)./255;
    [m,n,o]=size(img);
    
    for i=1:m
        for j=1:n    
            celta = acosd(((2*R(i,j) - B(i,j) - G(i,j))/2) / power((power(R(i,j)-G(i,j), 2)+(R(i,j)-B(i,j))*(G(i,j)-B(i,j))), 0.5));    
            if(B(i,j)<=G(i,j))
                H(i,j)=celta/360;
            else
                H(i,j)=(360-celta)/360;
            end
    
            S(i,j)=1-((3/(R(i,j)+G(i,j)+B(i,j)))*min([R(i,j),G(i,j),B(i,j)]));
        end
    end
    I=1/3*(R+G+B);
    
    HSI=cat(3,H,S,I);
%     HSI(:,:,1)=H;
%     HSI(:,:,2)=S;
%     HSI(:,:,3)=I;
end

