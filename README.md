# deformdev

Deformation Device Code Protocol

1. Open up excelscript.m file, this is the file that runs all of the other functions and where you will have to customize for your settings
2. Specify the tiff file name, the desired .xls file name, the base image, and how many frames you want analyzed
3. After establishing these variables click run
4. Your excel file will contain columns with Area, Perimeter, Deformation, the Index (or which frame) and the Location (X coordinate of where the centroid of the cell is)
5. You can either analyze the data using a scatterplot with Deformation on Y axis and the Location on X to show how it travels through channel, or plot through matlab
6. Common issues:
- processing time: to reduce processing time you can reduce the number of frames per run so that each file is broken up into segments, more segments mean the table is growing and collecting and storing that data uses up most of the processing time
- Irregular Areas or Deformation, this can happen if the border surrounding the cell is not defined enough, to account for this remove any data points with extremely high perimeter values
