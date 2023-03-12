%% this script clips the spectrum portion of the image out of the rest of the image 
%% Experimentally, we saw that in the x direction a +/-700 pixel region about the maximum gray sscale was good 
%% Written by Kavya Ummethala : 2/28/21

clear all 
close all 
clc
%looks for all jpg files 
ImageStruct=dir('*.jpg');
n=length(ImageStruct);
%clips out the spectrum
for i=1:n,
    %read in image
    rawimg= imread(ImageStruct(i).name);
    %Gray scale of raw image looking for maximum
    %Ix and Iy are the index 
    GRrawimg=rgb2gray(rawimg);
    [maxx_GRrawimg,Iy] = max(max(GRrawimg,[],1));
    [maxy_GRrawimg,Ix] = max(max(GRrawimg,[],2));
    rawimg_clip = rawimg([(Ix-400):(Ix+400)],[(Iy-700):(Iy+700)], :);
    
    %image(rawimg);
    %read in the file name
    f_name=ImageStruct(i).name;
    outf_fname= ['clip', f_name];
    imwrite(rawimg_clip ,outf_fname);
    
end