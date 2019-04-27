function step2 = part1bstep2(sz2, print)
    y = meshgrid(1:sz2(1), 1:sz2(2));
    x = y';

    step2 = sin(0.2 .* x) + sin(0.3 .* x) + cos(0.4 .* x) + ...
        sin(sqrt(x .* x + y .* y) .* 0.15) + sin(sqrt(x .* x + y .* y) .* 0.35);
    
    if print
        imshow(step2);
    end
end