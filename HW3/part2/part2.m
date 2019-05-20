addpath('util');
path = 'subset1/';

% note: in part 2 folder, there is three .m files to get 3D/3D coordinates
% for get correspondencies
% I already made the one for subset1 so feel free to use it.
% Also, feel free to modify to get those data for your own subset

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load world coordinates (Nx3) and camera coordinates (Mx2)
%
% note: visualize 2d points with 3D labels to check
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = strcat(path, 'subset1imgs.mat')
%load original picture originals
load(filename, 'originals');

[ N, h, w ] = size(originals);
clear h w

for i = 1:N
  % img i
  img = singlePic(originals, i);

  % visible points with 3D coord
  pts3 = getCorresp3D(path, i);

  filename = strcat(path, 'calibs/img', num2str(i), '.mat');
  %load 2D coordinates x and y
  load(filename);

  visualizedpoints(img, x, y, pts3);
end

clear img xy2D i x y pts3 filename

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% calibration with 2D and 3D coordinates
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ks = {};
Rs = {};
Ts = {};

for i = 1:N
  pts3 = getCorresp3D(path, i);

  filename = strcat(path, 'calibs/img', num2str(i), '.mat');
  %load 2D coordinates x and y
  load(filename);
  pts2 = [x'; y']';

  [K, R, t] = calibrate(pts2, pts3);
  Ks{end+1} = K;
  Rs{end+1} = R;
  Ts{end+1} = t;
end

filename = strcat(path, 'calibs/KRT.mat');
save(filename, 'Ks', 'Rs', 'Ts');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% calibration with 2D and 3D coordinates
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plotCam(Ts, Rs);
