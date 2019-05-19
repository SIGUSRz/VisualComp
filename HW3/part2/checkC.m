function checkC(C, pts2, pts3)

  M = size(pts3, 1);

  hcs3 = [pts3'; ones(1, M)];
  testprint = C * hcs3;
  testprint(1, :) = testprint(1, :) ./testprint(3, :);
  testprint(2, :) = testprint(2, :) ./testprint(3, :);
  testprint(3, :) = testprint(3, :) ./testprint(3, :);

  disp('---------------------------------------------------------------------');
  disp('-------check if they matches-----------------------------------------');
  disp('reconstructed 2D')
  disp(testprint(1:2, :))
  disp('priginal 2D')
  disp(pts2')
end
