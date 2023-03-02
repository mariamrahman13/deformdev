%% This function cuts out the ROI from the frame
function [roi_image] = roicut(bin_image, x_coord)

    % needs to be imshow for ROI actions
    imshow(bin_image);

    % dimensions for ROI box
    y_coord = 5;
    x_width = 250;
    y_width = 100;

    % cutting the ROI box
    ROI = drawrectangle('Position', [x_coord, y_coord, x_width, y_width]);
    mask = ROI.createMask;
    S = regionprops(mask, 'BoundingBox');
    b = floor(S(1).BoundingBox);
    roi_image = bin_image(b(2):b(2)+b(4), b(1):b(1)+b(3));
    maskcut = double(mask(b(2):b(2)+b(4), b(1):b(1)+b(3)));
end