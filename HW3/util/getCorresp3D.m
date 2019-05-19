function pts3 = getCorresp3D(path, i)
  filename = strcat(path, "worldcoordinates.mat");
  %load 3D coordinates block3D Nx3
  load(filename, 'block3D');

  filename = strcat(path, "wheretoselect.mat");
  %load 3D selection blocksV Mx1
  load(filename, 'blocksV');

  % visible 3D points in img1
  visible = blocksV{i};

  M = size(visible, 1);
  v = [1:M];
  v = nonzeros(visible .* reshape(v, [M, 1]));

  pts3 = block3D(v, :);
end
