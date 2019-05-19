%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% after run calib3D.m and getVisibleMask.m
% get 2D coordinate following masks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('subset1/worldcoordinates.mat')
load('subset1/wheretoselect.mat');
% visibles
% all3D
assert(size(visibles{1}, 1) == size(all3D, 1), 'visible (mask) and all3D has different size');
assert(size(blocksV{1}, 1) == size(block3D, 1), 'blocksV (mask) and block3D has different size');

addpath('util');
load('subset1/subset1imgs.mat');
N = size(originals, 1)

for i = 1:N
  img = singlePic(originals, i);
  numpts = sum(blocksV{i}(:));

  figure, imshow(img);
  title(num2str(numpts));
  hold on
  [x, y] = ginput(numpts);
  hold off
  filename = strcat('subset1/calibs/img', num2str(i), '.mat')
  save(filename, 'x', 'y');
end

clear img numpts x y filename
