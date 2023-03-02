%% This function optimizes the location of the centroid so that the object of interest is always in the middle of the ROI
function [xcoord] = centroidtrack(imageid, base, index, xcoord)
    
    % conduct image analysis on the frame
    BIN_I = bin_analysis(imageid, index, base);
    ROI_I = roicut(BIN_I, xcoord);
    prelim_I = filt_img(ROI_I);

    % find centroid 
    paramtable = paramcheckcentroid(prelim_I, index);
    if ~isempty(paramtable)

        % use centroid value to set new xcoord value
        centroid = paramtable.Centroid(1,1);
        xcoord = xcoord + centroid - 100;

        % verify the new ROI location
        ROI_I = roicut(BIN_I, xcoord);
    end