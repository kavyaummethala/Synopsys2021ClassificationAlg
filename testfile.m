
clear all
close all
clc
load trainednetwork;
% Read the contents of the current directory and look for all jpg files
ImageStruct = dir('*.jpg');
n = length(ImageStruct);
correctcount = 0;
%Write a loop to go through all the .jpg files found and try to rename them
for i=1:n,
    % Read in image
    rawimg = imread(ImageStruct(i).name);
    %image(rawimg);
    % Read in the current filename
    f_name=ImageStruct(i).name;
    out=classify(net,rawimg);
    if strfind(f_name,char(out)),
        correctcount = correctcount+1;
    end
end

    
PercentCorrect = correctcount/n*100;
    disp(['Percent correct = ', num2str(PercentCorrect) ,' %']);
