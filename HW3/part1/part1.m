addpath('util');
path = 'subset1/';
thresh = 5;

run('vlfeat/toolbox/vl_setup');
vl_version verbose

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% find features and save features
% you need only first time
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [Ds, Fs] = newFeatures(originals, masks, N, path);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load and plot features and save features
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% if you already have Ds Fs data, load it
filename = strcat(path, 'savedDFs.mat');
load(filename);
disp(['loaded Ds and Fs from ', path]);

for i = 1:N
  img = singlePic(originals, i);

  fig = figure(1);
  display_features(img, Fs{i});
  savefile = strcat("part1/results/part1_features_img", num2str(i) ,".png");
  saveas(fig,savefile);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% find matches and save them and their Score
% you need only first time
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Matches, Scores] = newMatches(Ds, N, path);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load and plot matches and save matches
%
% note: display only top 10 matches
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename = strcat(path, 'savedMS.mat');
load(filename);
disp(['loaded Matches and Scores from ', path]);

for i = 1:N-1
  j = i+1;

  Ii = singlePic(originals, i);
  Ij = singlePic(originals, j);
  match = Matches{i};

  fig = figure(2);

  % displays only top 10 matches
  display_matches(Ii, Ij, match(: ,1:10), Fs{i}, Fs{j});
  drawnow;
  savefile = strcat("part1/results/part1_matches_img", num2str(i), num2str(j) ,".png");
  saveas(fig,savefile);
end

clear fig img thresh savefile i j Ii Ij match filename
