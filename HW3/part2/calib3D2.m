
% blue bottom
X = [0 64 64 0];
Y = [0 0 64 64];
Z = zeros(1, 4);
bluebottom = [X; Y; Z]';

% redtop
Z = ones(1, 4) * 29;
redtop = [X; Y; Z]';

% green1 top
X = [16 48 48 16];
Y = [16 16 48 48];
Z = ones(1, 4) * 48;
green1top = [X; Y; Z]';

% green/yellow
X = [0 32 32 0];
Y = [48 48 80 80];
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

block3D = cat(1,bluebottom, redtop, green1top, greenyellow, yellow, corner);

save('subset2/worldcoordinates.mat','block3D');
