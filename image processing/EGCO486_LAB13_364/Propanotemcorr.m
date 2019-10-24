function [output] = Propanotemcorr(img1,img2)

    leftpic=img1;
    rightpic=img2;
    img1 = rgb2gray(img1);
    img2 = rgb2gray(img2);
    img1 = double(img1);
    [z1,z2,z3] = size(img2);
    img2 = double(img2(:,1:(0.1*z2),:));
    [m1,n1]=size(img1);
    [m2,n2]=size(img2);
    MeanImg2=mean(mean(img2));
    diff=zeros(m1,n1);
    for i = 1 : m1-m2+1
        for j = 1 : n1-n2+1
            SubIm = img1(i:i+m2-1,j:j+n2-1);
            MeanSub = mean(mean(SubIm));
            top =0;
            down1 =0;
            down2 =0;
            for a=1:m2
                for b=1:n2
                    top = top + ((SubIm(a,b)-MeanSub)*(img2(a,b)-MeanImg2));
                    down1 = down1 +  power((img2(a,b)-MeanImg2),2);
                    down2 = down2 +  power((SubIm(a,b)-MeanSub),2);
                end
            end
            down = down1*down2;
            diff(i,j) = top/(power(down,0.5));
        end
    end
    output=leftpic;
    for i=1:m1
        for j=1:n1
            if abs(diff(i,j)) == max(max(abs(diff)))
                output(i:i+m1-1,j:j+n1-1,:) = rightpic;
            end

        end
    end
end

