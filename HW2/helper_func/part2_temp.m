function subtract = part2_temp(img, ksize, sigma)

    f = figure;
    [imgM, imgP] = part1bstep3(img);
    
    log_imgM = log(1 + imgM);
    filter = (log_imgM > .8*max(log_imgM(:)) ) | (log_imgM < .15*max(log_imgM(:)) );
    
    
    pattern = real(abs(ifft2(imgM .* exp(j * imgP) .* filter)));
    subtract  = real(abs(ifft2(imgM .* exp(j * imgP) .* (1-filter)))) + 0.5;

    f = figure;
    a = subplot(2, 3, 1);
    imshow(fftshift(filter),[]);;
    title('filter');
    
    a = subplot(2, 3, 2);
    imshow(fftshift(1-filter),[]);;
    title('1-filter');
    

    a = subplot(2, 3, 4);
    imshow(img);;
    title('original');
    
    a = subplot(2, 3, 5);
    imshow(pattern);;
    title('pattern?');
    
    a = subplot(2, 3, 6);
    imshow(subtract);;
    title('subtract');
    
end