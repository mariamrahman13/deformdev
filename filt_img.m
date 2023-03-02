%% This function filters out the noise from the images and takes the object with the largest area in the range

function [fin_image] = filt_img(roi_image)
    % creates binary image and fills in noise
    BW = imbinarize(roi_image);
    BW = imclearborder(BW);
    BWf = imfill(BW, 'holes');
    
    % takes largest object in the bottom area range
    range = [2000, 5000];
    % returns image with just the selected object
    fin_image = bwareafilt(BWf, range);
end