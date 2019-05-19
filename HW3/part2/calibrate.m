function [K, R, t] = calibrate(pts2, pts3)

    M = size(pts3, 1);

    u = pts2(:, 1);
    v = pts2(:, 2);
    X = pts3(:, 1);
    Y = pts3(:, 2);
    Z = pts3(:, 3);


    for i = 1:M
      j = 2 * i;
      A(j - 1, :) = [X(i), Y(i), Z(i), 1, 0, 0, 0, 0, ...
                     -u(i)*X(i), -u(i)*Y(i), -u(i)*Z(i)];
      A(j, :)     = [0, 0, 0, 0, X(i), Y(i), Z(i), 1, ...
                     -v(i)*X(i), -v(i)*Y(i), -v(i)*Z(i)];
      B(j -1, 1)  = u(i);
      B(j, 1)     = v(i);
    end

    % least-squares
    C_init = transpose([A\B; 1]);
    C = [C_init(1:4); C_init(5:8); C_init(9:12)]; % reshape

    checkC(C, pts2, pts3);

    C1 = C(:, 1:3);
    C2 = C(:, 4);
    t = -1 * inv(C1) * C2;
    [R, invK] = qr(inv(C1), 0);

    K = inv(invK);
    K = K / K(3, 3);

    if K(1, 1) < 0
        K(:, 1) = -K(:, 1);
        R(:, 1) = -R(:, 1);
    end

    if K(2, 2) < 0
        K(:, 2) = -K(:, 2);
        R(:, 2) = -R(:, 2);
    end
end
