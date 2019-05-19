numP = 9*9 + 4*7;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% checkerboard

[X,Y] = meshgrid(1:9,1:9);
X = X * 20;
Y = Y * 20;

X = reshape(X, 81, 1);
Y = reshape(Y, 81, 1);
Z = zeros(81, 1);
checkerboard = [X'; Y'; Z']';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% blocks

% blue bottom
X = [0 64 64 0];
Y = [0 0 64 64];
Z = zeros(1, 4);
bluebottom = [X; Y; Z]';

% blue/red
Z = ones(1, 4) * 19;
bluered = [X; Y; Z]';

% redtop
Z = ones(1, 4) * 29;
redtop = [X; Y; Z]';

% green1 top
X = [16 48 48 16];
Y = [16 16 48 48];
Z = ones(1, 4) * 48;
green1top = [X; Y; Z]';

% green2bottom
X = [0 32 32 0];
Y = [48 48 80 80];
Z = ones(1, 4) * 29;
green2bottom = [X; Y; Z]';

% green/yellow
Z = ones(1, 4) * 48;
greenyellow = [X; Y; Z]';

% yellow
Z = ones(1, 4) * 67;
yellow = [X; Y; Z]';

% corner
X = [20 180 180 20];
Y = [20 20 180 180];
Z = zeros(1, 4);
corner = [X; Y; Z]';

% add_corner
X = [180 160 40 20 160 180];
Y = [160 180 180 160 20 40];
Z = zeros(1, 6);
add_corner = [X; Y; Z]';

all3D = cat(1, checkerboard, bluebottom, bluered, redtop, green1top, green2bottom, greenyellow, yellow);
block3D = cat(1,bluebottom, bluered, redtop, green1top, green2bottom, greenyellow, yellow, corner, add_corner);

assert(logical(mean(size(all3D)==[numP, 3])), 'you might forget to add some blocks');

save('subset1/worldcoordinates.mat', 'all3D', 'block3D');
