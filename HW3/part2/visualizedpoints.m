function visualizedpoints(img, x, y, pts3)
  % visualize
  % - where you select to calibrate
  % - and its 3D coordinates
  %
  % if you get mismatched 2D 3D coordinates
  % then you might have bug in getVisibleMask.m
  % or wrong click in ginput

  assert(size(x,1) == size(pts3, 1), '2D and 3D coord does not match')
  numpts = size(x, 1);
  labels = {};

  fig = figure;
  imshow(img);
  hold on;
  s = scatter(x, y);
  s.MarkerEdgeColor = 'white';

  for i = 1:numpts
    labels{end+1} = mat2str(pts3(i, :));
  end

  dx = 0.1; dy = 0.1;
  t = text(x+dx, y+dy, labels);
  set(t, 'Fontsize', 12)
  set(t, 'Color', 'magenta')

  drawnow;
end
