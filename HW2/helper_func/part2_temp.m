function subtract = part2_temp(img, ksize, sigma)

    limC = 1;

    f = figure;
    [imgM, imgP] = part1bstep3(img);
    
    [w, h] = size(img);
    I = img;
    I=I-mean(I(:)); % Should I take zero-mean?
    shiftedF = fftshift(fft2(I));
    
    log_imgM = log(1 + imgM);
    filter = (log_imgM > .8*max(log_imgM(:)) ) | (log_imgM < .15*max(log_imgM(:)) );
    
    
    pattern = real(abs(ifft2(imgM .* exp(j * imgP) .* filter)));
%     subtract  = real(abs(ifft2(imgM .* exp(j * imgP) .* (1-filter)))) + 0.5;
    
    [r, c] = find(1-filter);
    % whos r
    for i=1:length(r)
        if (w-r(i))^2+(h-c(i))^2 > limC^2
            if r(i) > limC & c(i) > limC
                imgM(r(i)-limC:r(i)+limC,c(i)-limC:c(i)+limC)=0;
            end
        end
    end

%     subtract=real(ifft2(fftshift(shiftedF)));
    subtract  = real(abs(ifft2(imgM .* exp(j * imgP))));

    f = figure;
    a = subplot(3, 2, 1);
    imshow(fftshift(filter),[]);;
    title('filter');
    
    a = subplot(3, 2, 2);
    imshow(log(abs(shiftedF) + 1), []),colormap(gray),title('new magunitude');
    title('shiftedF');
    
    a = subplot(3, 2, 3);
    imshow(log(imgM + 1), []),colormap(gray),title('new magunitude');
    title('originalM');
    

    a = subplot(3, 2, 4);
    imshow(img);;
    title('original');
    
    a = subplot(3, 2, 5);
    imshow(pattern);;
    title('pattern?');
    
    a = subplot(3, 2, 6);
    imshow(subtract, []);;
    title('subtract');
    
end