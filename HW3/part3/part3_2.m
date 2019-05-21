addpath('util');
% path = 'subset1/';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% for each pair find F
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('code');

filename = strcat(path, 'subset2imgs.mat');
% filename = strcat(path, 'subset1imgs.mat');
%load original picture originals
load(filename, 'originals');

[ N, h, w ] = size(originals);
clear h w

Funds = {};
E1s = {};
E2s = {};

for i = 1:N-1
  j = i+1;

  % correspondencies Mx2 Mx2
  [x1, x2] = corresp2(path, i, j);

  % make x1 and x2 in homogeneous coordinate system
  M = size(x1, 1);
  onesM = ones(1, M);
  x1 = [x1'; onesM]';
  x2 = [x2'; onesM]';

  % using given function under code/
  i
  if i ~= 4
    i
    [F, e1, e2] = fundmatrix(x1', x2');
  else
    F = F;
    e1 = e1;
    e2 = e2;
  end

  Funds{end+1} = F;
  E1s{end+1} = e1;
  E2s{end+1} = e2;

end

filename = strcat(path, 'savedFund.mat');
save(filename, 'Funds');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% get rid of wrong matches
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = strcat(path, 'savedMS.mat');
%load possible matches
load(filename, 'Matches');

filename = strcat(path, 'savedDFs.mat');
%load features
load(filename, 'Fs');

trueMs = {};
for i = 1:N-1
  j = i + 1;
  trueM = getTrueM(Funds{i}, Matches{i}, Fs{i}, Fs{j});
  trueMs{end+1} = trueM;
end

filename = strcat(path, 'savedTrueM.mat');
save(filename, 'trueMs');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% plot actual matches
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('part1')

for i = 1:N-1
  j = i+1;

  Ii = singlePic(originals, i);
  Ij = singlePic(originals, j);
  match = trueMs{i};

  fig = figure(1);
  display_matches(Ii, Ij, match, Fs{i}, Fs{j});
  savefile = strcat('part3/results/trueMatches', num2str(i) ,'.png');
  saveas(fig,savefile);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% draw epipolar line
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:N-1
  j = i+1;

  Ii = singlePic(originals, i);
  Ij = singlePic(originals, j);

  match = trueMs{i};

  fig = figure(2);
  getEpipolarline(Ii, Ij, Funds{i}, E1s{i}, E2s{i}, match(:, 6:8), Fs{i}, Fs{j});
  savefile = strcat('part3/results/epipolar', num2str(i),num2str(j) ,'.png');
  saveas(fig,savefile);
end
