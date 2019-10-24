function [ RGB,R,G,B ] = Myhsi2rgb( img,I )
    
    H=img(:,:,1)*360;
    S=img(:,:,2);
%     I=img(:,:,3);
    [m,n,o]=size(img);
    for i=1:m
        for j=1:n
            if H(i,j)>=0 && H(i,j)<120
                B(i,j)=I(i,j)*(1-S(i,j));
                R(i,j)=I(i,j)*(1+(S(i,j)*cosd(H(i,j)))/cosd(60-H(i,j)));
                G(i,j)=(3*I(i,j))-(R(i,j)+B(i,j));
            elseif H(i,j)>=120 && H(i,j)<240
                H(i,j)=H(i,j)-120;
                R(i,j)=I(i,j)*(1-S(i,j));
                G(i,j)=I(i,j)*(1+(S(i,j)*cosd(H(i,j)))/cosd(60-H(i,j)));
                B(i,j)=(3*I(i,j))-(R(i,j)+G(i,j));
            else
                H(i,j)=H(i,j)-240;
                G(i,j)=I(i,j)*(1-S(i,j));
                B(i,j)=I(i,j)*(1+(S(i,j)*cosd(H(i,j)))/cosd(60-H(i,j)));
                R(i,j)=(3*I(i,j))-(G(i,j)+B(i,j));
            end
        end
    end
    RGB=cat(3,R,G,B);
end

