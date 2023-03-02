%% This function does the image subtraction and puts the image in black and white
function [bin_image] = bin_analysis(imageid, index, base)
    cellpic = imread(imageid, index);
    basepic = imread(imageid, base);

    I = basepic-cellpic;
    BW = I>= 1;
    BW = double(BW);
    bin_image = BW;

end