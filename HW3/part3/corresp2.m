function [pts2L, pts2R] = corresp(path, i, j)
    filename = strcat(path, '/calibs/calib', num2str(i), '.mat');
    load(filename);
    pts2L = [x'; y']';

    filename = strcat(path, '/calibs/calib', num2str(j), '.mat');
    load(filename);
    pts2R = [x'; y']';

    filename = strcat(path, "wheretoselect.mat");
    %load 3D selection blocksV Mx1
    load(filename, 'blocksV');

    wI = blocksV{i};
    wJ = blocksV{j};
    count = 1;
    for ii=1:size(blocksV{i}, 1)
        if wI(ii) ~= 0
            wI(ii) = count;
            count = count +1;
        end
    end
    count = 1;
    for jj=1:size(blocksV{j}, 1)
        if wJ(jj) ~= 0
            wJ(jj) = count;
            count = count +1;
        end
    end
    both = wI & wJ;
    wI = wI(both)';
    wJ = wJ(both)';
    pts2L = pts2L(wI, :);
    pts2R = pts2R(wJ, :);
end
