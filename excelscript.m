%% This script is to run the celltracking algorithm and load the dataset into an excel file

imageid = "XXXX.tif";
% imageid = "27418_1_103.tif";
% replace the above with the name of the tiff file you will be analyzing

base = XX ;
% replace the above with the frame number of a slice showing the empty
% channel

frames = XXX;
% replace the above with the total number of frames OR
% frames = size(imfinfo(imageid),1);

% the following creates the main table
size = [1 6]
emptyarray = zeros(size);
totaltab = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Index', 'Location'});

index = 0;

totaltab = celltrackop(imageid, index, base, frames);

filename = "XXX.xls"
% replace the above with the desired name of file
write(totaltab, filename);
% will write the table to an excel file
