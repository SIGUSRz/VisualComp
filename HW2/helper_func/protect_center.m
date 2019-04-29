function centerfilter = protect_center(imgsize, rad)

    diam = rad*2 + 3
    circle = ones(diam, diam);
    cent = rad+2;

    for x=1:diam
        for y=1:diam
            if (cent - x)^2 + (cent-y)^2 > rad^2
                circle(x, y) = 0;
            end
        end
    end

    extension = floor((imgsize-size(circle))/2);
    large = padarray(circle, extension, 'replicate');
    large(imgsize(1), imgsize(2)) = 0;
    
    centerfilter = 1 - large;

end