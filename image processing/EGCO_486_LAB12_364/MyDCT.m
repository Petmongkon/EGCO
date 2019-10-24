function output = MyDCT(input_img,u,v)
    [m,n] = size(input_img);
    sum = 0;
    aU = alpha(m,u-1);
    aV = alpha(n,v-1);    
    for i = 1:m
        sumY = 0;
        cosX = CosTransform(i-1,u-1);
        
        for j = 1:n
            
            cosY = CosTransform(j-1,v-1);           
            sumY = sumY + input_img(i,j)*cosY;
        end
        sumY = sumY*cosX;
        sum = sum + sumY;
    end
    output = sum*aV*aU;
end

