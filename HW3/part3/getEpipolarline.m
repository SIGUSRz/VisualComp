function getEpipolarline(I1, I2, F, e1, e2, match, f1, f2)
  % f has 4xL features where rows = [x, y, s, TH]
  indices1 = match(1,:);
  f1match = f1(1:2, indices1);
  indices2 = match(2,:);
  f2match = f2(1:2, indices2);

  e1xL = ones(size(f1match)); %2xL
  e1xL(1, :) = e1(1);
  e1xL(2, :) = e1(2);

  e2xL = ones(size(f2match));
  e2xL(1, :) = e2(1);
  e2xL(2, :) = e2(2);

  imshow([I1,I2],[]);
  hold on;
  o = size(I1,2) ;

  %drawing only 3 lines (replace 1:3 -> : to see all lines)

  lines1 = line([f1match(1,1:3)  ; e1xL(1,1:3)  ], ...
               [f1match(2,1:3)   ; e1xL(2,1:3)  ]);
  lines2 = line([f2match(1,1:3)+o; e2xL(1,1:3)+o], ...
               [f2match(2,1:3)   ; e2xL(2,1:3)  ]);
  set(lines1,'linewidth', 2, 'color', 'magenta');
  set(lines2,'linewidth', 2, 'color', 'yellow');

  s1 = scatter(f1match(1,1:3), f1match(2,1:3));
  s1.MarkerEdgeColor = 'magenta';

  s2 = scatter(f2match(1,1:3)+o, f2match(2,1:3));
  s2.MarkerEdgeColor = 'yellow';

  drawnow;
end
