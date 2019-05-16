addpath("part1", "part2", "part0")

load('savedoriginals.mat');
load('pts3.mat');
load('wheres.mat');
[n, r, c] = size(originals);

% check if calibrate works
% n = 2

for i = 1:n

    [K, R, t] = calibrate(pts3, wheres, i);
    K
%     calibtest(originals, i);
end