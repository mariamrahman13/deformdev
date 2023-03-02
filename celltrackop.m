
%% This function tracks the cell using locations instead of following the cell, it takes each frame and identifies cells in the ROIs based on the xcoordinate. The x coordinate is recorded and can be used to track the deformation through the passage. 

function [newtab] = celltrackop(imageid, index, base, frames)

    % create empty array to make table
    size = [1 6]
    emptyarray = zeros(size)
    newtab = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Index', 'Location'});
    
    % initial x coordinate of cell for first frame
    xcoord = centroidtrack(imageid, base, 1, 100);
        
    % analyze all frames starting with 1
    for framepoint = 1:frames
        index = framepoint;

        % while xcoord is less than full length of channel
        while xcoord <1100

            % image analysis
            binimg = bin_analysis(imageid, framepoint, base);
            roiimg = roicut(binimg, xcoord);
            filtimg = filt_img(roiimg);

            %check to see if image actually has a cell inside
            if ~isempty(paramcheck(filtimg, index))

                % if so, get the measurements and add it to table, or add a
                % zero row if nothing
                paramtab = paramcheck(filtimg, frampoint)
                paramtab.Location = xcoord + 100;
                newtab = vertcat(newtab, paramtab);
            end

            % increase xcoord to move along channel
            xcoord = xcoord + 180;
            % optimize xcoord so cell is in the middle of the ROI
            xcoord = centroidtrack(imageid, base, index, xcoord);
        end

        % once that frame is finished, reset the xcoord
        xcoord = centroidtrack(imageid, base, framepoint + 1, 100);
    
    % move onto the next frame
    end

    % remove any zero table rows from the table
    newtab(~newtab.Area,:) = [];
