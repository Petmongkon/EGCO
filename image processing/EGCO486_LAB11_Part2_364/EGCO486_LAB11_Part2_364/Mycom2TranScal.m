function output = Mycom2TranScal(img, tx, ty, sx, sy)
    tran = Mytranslate(img, tx, ty);
    output = Myscale(tran, sx, sy);
end