%% This function generates the deformation statistics for an ROI, and if there is none (no object) it will return an empty table row
function [paramtable] = paramcheck(fin_image, index)
    paramtable = regionprops("table", fin_image, "Area", "Perimeter", "Circularity");
    paramtable.Deformation = 1-paramtable.Circularity;
    if ~isempty(paramtable)
        paramtable = paramtable(1,:);
        paramtable.Index = index;
    else
        paramtable = array2table(zeros(0, 6));
    end
end