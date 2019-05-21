addpath('util')
path = 'subset2/';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load images and save data under the subset1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[originals, masks] = loadimages(path, 'jpg');
filename = strcat(path, 'subset2imgs.mat');
% filename = strcat(path, 'subset1imgs.mat');
save(filename, 'originals', 'masks');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% preprocess
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename = strcat(path, 'subset2imgs.mat');
% filename = strcat(path, 'subset1imgs.mat');
load(filename);
disp(['loaded images from ', path]);

% N x h x w grayscale images with double and logical
% load() function allows you to get originals and masks

[ N, h, w ] = size(originals);
clear h w

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Part1, load images and masks, finidng features and matches
%
% Note: I put 7 images under the folder called subset1 ...N = 7
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('part1')
part1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Part2, get correspondencies on blocks/checkerboards, calibrate
%
% Note: calibration results are saved in subset1/calibs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('part2')
part2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Part3, find N-1 fundamental matrix and epipolar lines ON THE SIFT (horse)
%
% Note: remove false matches from part1 which is saved under subset1/
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath('part3')
part3

addpath('part4')
part4
