function [ output_args ] = MySQ( input_args,quality_factor )
    if quality_factor >=1 && quality_factor <= 49
        ScFactor = 5000/quality_factor;
    elseif quality_factor >=50 && quality_factor <= 99
        ScFactor = 200 - (2*quality_factor);
    else
        ScFactor = 1;
    end
    output_args = floor(((input_args(:,:)*ScFactor)+50)/100);
end


