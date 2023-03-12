%Reduce files sizes
clear all
close all
clc

% Read the contents of the current directory and look for all jpg files
ImageStruct = dir('*.jpg');
n = length(ImageStruct);

for i=1:n,
    % Read in image
    rawimg = imread(ImageStruct(i).name);
    %gets the dimensions of the raw image
    [sx,sy,sz] = size(rawimg);
    %reduced the size of the image
    %set of commands below found from Matlab helpwindow on reducing image
    %size
    %reducing by a factor 10 along the x direction and 3 along the y
    %direction
    %Totally reduces the image size by a factor of 30(10x3)
    F = griddedInterpolant(double(rawimg));
    xq = (0:10:sx)';
    yq = (0:3:sy)';
    zq = (1:sz)';
    vq = uint8(F({xq,yq,zq}));
    imwrite( vq,ImageStruct(i).name);
end

