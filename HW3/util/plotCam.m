function plotCam(Ts, Rs)
    figure;
    hold on;

    % plot origin
    plot3(0, 0, 0, 'bo', 'MarkerSize', 5);
    n = 30;
    set(gca, 'CameraPosition', [n n n]);

    dx = 5; dy = 5; dz = 5;
    t1 = text(dx, dy, dz, {'(0, 0, 0)'});
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

    color = {'yellow', 'magenta', 'cyan', 'red', 'green', 'blue', 'black'};


    for i = 1:length(Ts)

        % camera position by translation vector
        s = scatter3(Ts{i}(1), Ts{i}(2), Ts{i}(3));
        s.MarkerEdgeColor = color{i};

        % camera orientation by rotation matrix
        starts = [0; 0; 0];
        starts = starts + Ts{i};

        directions = [0; 0; -100];
        directions = Rs{i} * directions;

        starts =  starts';
        directions =  directions';
        q = quiver3(starts(:, 1), starts(:, 2), starts(:, 3), ...
                    directions(:, 1), directions(:, 2), directions(:, 3));
        set(q, 'Color', color{i})

        t2 = text(starts(1)+dx, starts(2)+dy, starts(3)+dz, {strcat('camera', num2str(i))});
        set(t2, 'Fontsize', 10)
        set(t2, 'Color', 'black')

    end

    xlabel('along blue/red blocks');
    ylabel('along blue/red/green/yellow blocks');
    grid on;
    rotate3d on;
    axis equal;
    hold off;
end
