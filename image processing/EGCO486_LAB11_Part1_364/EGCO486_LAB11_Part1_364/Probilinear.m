function output = Probilinear(img, scale)
    [m,n] = size(img);
    sr = m/scale(1);
    sc = n/scale(2);
    output = zeros(scale);
    for i=1:scale(1)
        for j=1:scale(2)
            rf = sr*i;
            cf = sc*j;

            top = floor(rf);
            bottom = ceil(rf);
            left = floor(cf);
            right = ceil(cf);

            topDis = abs(rf - top);
            botDis = 1 - topDis;
            leftDis = abs(cf - left);
            rightDis = 1 - leftDis;
            output(i,j) = 0;

            if (top > 0 && left > 0)
                output(i,j) = output(i,j) + img(top,left)*botDis*rightDis;
            end
            if (top > 0 && right > 0)
                output(i,j) = output(i,j) + img(top,right)*botDis*leftDis;
            end
            if (bottom > 0 && left > 0)
                output(i,j) = output(i,j) + img(bottom,left)*topDis*rightDis;
            end
            if (bottom > 0 && right > 0)
                output(i,j) = output(i,j) + img(bottom,right)*topDis*leftDis;
            end

        end
    end
    output = uint8(output);
end