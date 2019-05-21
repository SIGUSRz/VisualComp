blocksV = {};



visibles_24 = [...
    1 1 1 0; ... %blue
    1 1 1 0; ... %red
    1 1 1 0; ... %green
    1 0 1 0; ... %green/yellow
    1 1 1 0; ... %yellow
    0 1 1 1 ... %corners
];

blocksV{end+1} = reshape(visibles_24', [24, 1]);


visibles_24 = [...
    1 1 0 0; ... %blue
    1 1 0 0; ... %red
    1 1 0 1; ... %green
    1 0 0 0; ... %green/yellow
    1 1 0 1; ... %yellow
    0 1 1 0 ... %corners
];

blocksV{end+1} = reshape(visibles_24', [24, 1]);

visibles_24 = [...
    1 1 0 1; ... %blue
    1 1 0 0; ... %red
    1 1 0 1; ... %green
    1 0 0 1; ... %green/yellow
    1 1 0 1; ... %yellow
    0 1 0 1 ... %corners
];

blocksV{end+1} = reshape(visibles_24', [24, 1]);

visibles_24 = [...
    1 0 0 1; ... %blue
    1 0 0 0; ... %red
    1 0 0 0; ... %green
    1 0 0 1; ... %green/yellow
    1 0 1 1; ... %yellow
    0 1 1 1 ... %corners
];

blocksV{end+1} = reshape(visibles_24', [24, 1]);

visibles_24 = [...
    0 1 1 0; ... %blue
    0 1 1 0; ... %red
    0 1 1 0; ... %green
    0 1 1 0; ... %green/yellow
    0 1 1 0; ... %yellow
    0 1 0 0 ... %corners
];

blocksV{end+1} = reshape(visibles_24', [24, 1]);

visibles_24 = [...
    1 1 1 0; ... %blue
    1 1 1 0; ... %red
    1 1 1 0; ... %green
    0 0 1 0; ... %green/yellow
    1 1 1 0; ... %yellow
    0 1 0 0 ... %corners
];

blocksV{end+1} = reshape(visibles_24', [24, 1]);

save('subset2/wheretoselect.mat', 'blocksV');
