%%% Skeleton script for 395T Visual Recognition Assignment 1%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Kristen Grauman, UT-Austin
%%% Using the VLFeat library.  http://www.vlfeat.org.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ****Be sure to add vl feats to the search path: ****
% >>> run('VLFEATROOT/toolbox/vl_setup');
% where VLFEATROOT is the directory where the code was downloaded.
% See http://www.vlfeat.org/install-matlab.html

%% Intitial checks
fprintf('Be sure to add VLFeat path.\n');
clear;
close all;

%% get file names

folderPath = './Test_Datasets/UT_Tower/'; 
[templateName, sceneNames] = getFileNames(folderPath);

%% Read in the object template image.
% This is the thing we'll search for in the scene images.
im1 = im2single(rgb2gray(imread(templateName)));

%% Extract SIFT features from the template image.
%
% 'f' refers to a matrix of "frames".  It is 4 x n, where n is the number
% of SIFT features detected.  Thus, each column refers to one SIFT descriptor.
% The first row gives the x positions, second row gives the y positions,
% third row gives the scales, fourth row gives the orientations.  You will
% need the x and y positions for this assignment.
%
% 'd' refers to a matrix of "descriptors".  It is 128 x n.  Each column
% is a 128-dimensional SIFT descriptor.
%
% See VLFeats for more details on the contents of the frames and
% descriptors.
[f1, d1] = vl_sift(im1);
fprintf('%d SIFT features detected for template image\n\n\n\n', size(f1,2));

%% Loop through the scene images and do some processing
for sceneNum = 1:length(sceneNames)
    sceneName = sceneNames{sceneNum};
    fprintf('Reading image %s for the scene to search...\n', sceneName);
    im2 = im2single(rgb2gray(imread(sceneName)));
    name = strsplit(sceneName, '.');
    name = strcat('.', name(2));
    matchComp(im1, im2, f1, d1, name);
end