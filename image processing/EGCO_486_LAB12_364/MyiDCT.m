function output = MyiDCT(input_img,u,v)
    [m,n] = size(input_img);
    sum = 0;
       
    for i = 1:m
        sumY = 0;
        cosX = CosTransform(u-1,i-1);
        aU = alpha(m,i-1);
        
        for j = 1:n
            aV = alpha(n,j-1);
            cosY = CosTransform(v-1,j-1);
            sumY = sumY + input_img(i,j)*cosY*aV*aU;
        end
        sumY = sumY*cosX;
        sum = sum + sumY;
    end
    output = sum;
end