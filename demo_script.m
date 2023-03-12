%% demo script 
% this script is used to demo the final product during the presendation 
clear 
close all 
% load trainednetwork
load trainednetwork; 
% read image into variable 'I'
I=imread('clipAvocadoOil5022.jpg');
%classify command 
classify(nnet,I);
