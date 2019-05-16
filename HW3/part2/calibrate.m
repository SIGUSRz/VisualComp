function [K, R, t] = calibrate(pts3, wheres, i)
    filename = strcat("part2/calib", num2str(i), ".mat");
    load(filename);
    where = wheres{i};
    
    [w, c] = size(where);
    where = reshape(where.', [1, w*c])';
    v = [1:w*c];
    v = nonzeros(where .* reshape(v, [w*c, 1]));
    pts3 = pts3(v, :);

    N = length(v);
    
%     size(pts3)
%     size(x)
    u = x;
    v = y;
    X = pts3(:,1);
    Y = pts3(:,2);
    Z = pts3(:,3);

    for i = 1:N
    j = 2 * i;
    A(j - 1, :) = [X(i), Y(i), Z(i), 1, 0, 0, 0, 0, ...
                   -u(i)*X(i), -u(i)*Y(i), -u(i)*Z(i)];
    A(j, :)     = [0, 0, 0, 0, X(i), Y(i), Z(i), 1, ...
                   -v(i)*X(i), -v(i)*Y(i), -v(i)*Z(i)];
    B(j -1, 1)  = u(i);
    B(j, 1)     = v(i);
    end

    % least-squares
    M_init = transpose([A\B; 1]);
    M = [M_init(1:4); M_init(5:8); M_init(9:12)]; % reshape
    
    C1 = M(:, 1:3);
    C2 = M(:, 4);
    t = -1 * inv(C1) * C2;
    [R, invK] = qr(inv(C1), 0);

    K = inv(invK);
%     K = K / K(3, 3);

    if K(1, 1) < 0
        K(:, 1) = -K(:, 1);
        R(:, 1) = -R(:, 1);
    end

    if K(2, 2) < 0
        K(:, 2) = -K(:, 2);
        R(:, 2) = -R(:, 2);
    end
end
