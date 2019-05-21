%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% after run calib3D.m and getVisibleMask.m
% get 2D coordinate following masks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('subset2/worldcoordinates.mat')
load('subset2/wheretoselect.mat');
% visibles
% all3D
assert(size(blocksV{1}, 1) == size(block3D, 1), 'blocksV (mask) and block3D has different size');

addpath('util');
load('subset2/subset2imgs.mat');
N = size(originals, 1)

for i = 1:N
  img = singlePic(originals, i);
  numpts = sum(blocksV{i}(:));

  figure, imshow(img);
  title(num2str(numpts));
  hold on
  [x, y] = ginput(numpts);
  hold off
  filename = strcat('subset2/calibs/calib', num2str(i), '.mat')
  save(filename, 'x', 'y');
end

clear img numpts x y filename
