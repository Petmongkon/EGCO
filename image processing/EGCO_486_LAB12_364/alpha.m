function [output] = alpha(x,u)
    if x > 0
        if u > 0
            output = sqrt(2/x);
        else
            output = 1/sqrt(x);
        end
        if isnan(output)
            output = 0;
        end
    else
        output = 0;
    end
end

