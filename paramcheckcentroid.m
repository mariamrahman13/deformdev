%% This function checks if the image of choice based on the centroid has area statistics (is there an actual object in this ROI)

function [paramtable] = paramcheckcentroid(fin_image, index)
    paramtable = regionprops("table", fin_image, "Area", "Perimeter", "Circularity", "Centroid");
    paramtable.Deformation = 1-paramtable.Circularity;
    if ~isempty(paramtable)
        paramtable = paramtable(1,:);
        paramtable.Index = index;
    else
        paramtable = array2table(zeros(0, 6));
    end
end