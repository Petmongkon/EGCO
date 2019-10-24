function [ output ] = ProJPGblock( input_args,quantization_table )
    convertedImg = double(input_args) - 128;
    [m,n] = size(input_args);
    DCT_block = convertedImg;
    for i = 1:m
        for j = 1:n
            DCT_block(i,j) = MyDCT(convertedImg,i,j);
        end
    end
    quantized_block = round(DCT_block./quantization_table);
    zigzagResult = zigzag(quantized_block);
    InverseQuantiProcedure = izigzag(zigzagResult,8,8).*quantization_table;

    iDCT_block = convertedImg;
    for i = 1:m
        for j = 1:n
            iDCT_block(i,j) = MyiDCT(InverseQuantiProcedure,i,j);
        end
    end
    output = uint8(iDCT_block + 128);
end