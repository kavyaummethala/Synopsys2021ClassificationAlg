%% Clips the smear from the photo

clear all
close all
clc

% Read the contents of the current directory and look for all jpg files
ImageStruct = dir('*.jpg');
n = length(ImageStruct);

%Write a loop to go through all the .jpg files found and try to clip out
%the spectrum
for i=1:n,
    % Read in 8 bit rgb image
    rawimg = imread(ImageStruct(i).name);
    %convert to 8 bit gray scale
    rawgray = rgb2gray(rawimg);
    %from grayscale to binary
    rawbin = imbinarize(rawgray);
    %Find the 'white' part of the binary image ( finds the nonzero element)
    [xbin,ybin]=find(rawbin);
    %Finds the top most non zero element(white part)
    indx = min(xbin);
    %Finds the left most non zero element(white part)
    indy = min(ybin);
    % Gray scale of raw image for looking for maximum

   rawimg_clip = rawimg([(indx-200):(indx+500)],[(indy-300):(indy+800)],:);
   
   
    
    % Read in the current filename
    f_name=ImageStruct(i).name;
    outf_fname = ['clip', f_name];
    imwrite(rawimg_clip,outf_fname);
 
end