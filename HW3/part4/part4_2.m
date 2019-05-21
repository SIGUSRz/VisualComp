addpath('util');
path = 'subset2/';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% reconstruct 3D
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = strcat(path, 'subset2imgs.mat');
%load original picture originals
load(filename, 'originals');

[ N, h, w ] = size(originals);
clear h w

filename = strcat(path, 'savedTrueM.mat');
load(filename, 'trueMs');

filename = strcat(path, 'savedDFs.mat');
%load features
load(filename, 'Fs');

filename = strcat(path, 'calibs/KRT.mat');
load(filename, 'Ks', 'Rs', 'Ts');

filename = strcat(path, 'savedFund.mat');
load(filename, 'Funds');

figure;
hold on;

countpoints = 0;

for i = 1:N-1
  j = i + 1;

  if i ~= 4
  [xL, xR] = getMatchedF(Funds{i}, trueMs{i}, Fs{i}, Fs{j});
  camL = {Ks{i}, Rs{i}, Ts{i}};
  camR = {Ks{j}, Rs{j}, Ts{j}};

  LBs = [60; 110; -1];
  UBs = [200; 160; 120];

  X = triangulate(xL,xR,camL,camR);
  X = mask3D(X, LBs, UBs);

  countpoints = countpoints + size(X, 2);

  s = scatter3(X(1, :),X(2, :),X(3, :), 50, "fill");
  s.MarkerEdgeColor = 'white';
  s.MarkerFaceColor = 'blue';
  end
end


disp(strcat('In total, ', num2str(countpoints), ' points are used'))

for i = 0:2:9
  for j = 0:2:9
    p1 = [i*20 j*20 0];
    p2 = [(i+1)*20 j*20 0];
    p3 = [(i+1)*20 (j+1)*20 0];
    p4 = [i*20 (j+1)*20 0];

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 'black');
  end
end

for i = 1:2:9
  for j = 1:2:9
    p1 = [i*20 j*20 0];
    p2 = [(i+1)*20 j*20 0];
    p3 = [(i+1)*20 (j+1)*20 0];
    p4 = [i*20 (j+1)*20 0];

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 'black');
  end
end






%%%
% plot origin
plot3(0, 0, 0, 'bo', 'MarkerSize', 5);
n = 30;
set(gca, 'CameraPosition', [n n n]);

dx = 5; dy = 5; dz = 5;
t1 = text(-dx, -dy, -dz, {'(0, 0, 0)'});
set(t1, 'Fontsize', 10)
set(t1, 'Color', 'black')


% plot origin
plot3(200, 200, 0, 'bo', 'MarkerSize', 5);
n = 30;
set(gca, 'CameraPosition', [n n n]);

% plot the other corner of checkerboard
t2 = text(200+dx, 200+dy, dz, {'(200, 200, 0)'});
set(t2, 'Fontsize', 10)
set(t2, 'Color', 'black')

% colorList = {'Brown', 'Magenta', 'Cyan', 'Red', 'Green', 'Blue', 'Purple', 'Black'};
colorList = {[1.0 0.0 0], ...
             [0.8 1.0 0], ...
             [0.0 1.0 0], ...
             [0.0 1.0 1], ...
             [0.0 0.0 1], ...
             [1.0 0.0 1], ...
             [0.5 0.5 0.5], ...
             [0.8 0.8 1]};

for i = 1:length(Ts)

    % camera position by translation vector
    s2 = scatter3(Ts{i}(1), Ts{i}(2), Ts{i}(3));
    s2.MarkerEdgeColor = colorList{i};

    % camera orientation by rotation matrix
    starts = [0; 0; 0];
    starts = starts + Ts{i};

    directions = [0; 0; -100];
    directions = Rs{i} * directions;

    starts =  starts';
    directions =  directions';
    q = quiver3(starts(:, 1), starts(:, 2), starts(:, 3), ...
                directions(:, 1), directions(:, 2), directions(:, 3));
    set(q, 'Color', colorList{i})

    loc = mat2str(round(Ts{i}, 2)');



    t2 = text(starts(1)+dx, starts(2)+dy, starts(3)+dz, ...
              {strcat('camera', num2str(i), loc)});
    set(t2, 'Fontsize', 10)
    set(t2, 'Color', 'black')

end
%%%


xlabel('along blue/red blocks');
ylabel('along blue/red/green/yellow blocks');
grid on;
rotate3d on;
axis equal;

hold off;
