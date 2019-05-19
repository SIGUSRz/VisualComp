visibles = {};
blocksV = {};

% img1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 0 0 1 1 1 1;...
               0 0 0 0 0 1 1 1 1;...
               0 0 0 0 0 1 1 1 1;...
              %
               1 0 0 0 0 1 1 1 1;...
               1 0 0 0 0 0 1 1 1;...
               1 1 0 0 0 0 0 1 1;...
              %
               1 1 1 0 0 1 1 0 1;...
               1 1 1 1 0 0 0 1 0;...
               1 1 1 1 1 0 0 0 0 ];

visibles_28 = [1 0 0 1; 1 0 0 1; 1 0 0 0; 1 0 0 1;...
               1 0 0 1; 1 0 0 1; 1 0 0 1];

visibles_10 = [0 1 0 1 0 0 1 1 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

% img2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 0 0 1 1 1 1;...
               0 0 0 0 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 0;...
              %
               1 1 1 1 1 1 1 0 0;...
               1 1 1 1 1 0 1 0 0;...
               1 1 1 0 0 1 0 0 1;...
              %
               1 1 1 1 0 1 1 0 1;...
               1 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1 ];

visibles_28 = [0 0 0 0; 1 0 1 1; 1 0 1 0; 1 0 0 0;...
               1 0 0 0; 0 0 1 0; 1 0 1 1];

visibles_10 = [0 1 1 1 1 1 1 1 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

% img3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 1 0 0 0 1 1;...
               0 0 0 1 1 1 0 1 1;...
               0 0 0 1 1 1 0 1 1;...
              %
               1 1 0 1 1 1 0 1 1;...
               1 1 0 1 1 1 0 1 1;...
               1 1 1 1 1 1 1 1 1;...
              %
               1 1 1 0 1 1 1 1 1;...
               0 1 1 1 1 1 1 1 1;...
               0 1 1 1 1 1 1 1 1 ];

visibles_28 = [0 0 0 1; 0 0 0 1; 0 0 0 0; 0 0 0 0;...
               0 0 0 1; 0 0 1 1; 0 0 1 0];

visibles_10 = [0 1 1 0 1 1 1 0 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

% img4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
              %
               0 0 0 0 1 1 1 1 1;...
               0 1 0 1 0 1 1 1 1;...
               0 1 0 1 1 1 0 1 1;...
              %
               1 1 0 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1 ];

visibles_28 = [0 1 0 0; 0 1 0 0; 0 1 0 0; 0 0 0 0;...
               0 0 0 0; 0 0 0 0; 0 0 1 0];

visibles_10 = [0 1 1 1 1 1 1 1 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

% img5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
              %
               1 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
              %
               0 0 0 0 1 1 1 1 1;...
               0 0 0 0 0 0 1 1 1;...
               1 1 1 1 1 1 1 0 0];

visibles_28 = [0 1 0 0; 0 1 1 0; 0 0 1 0; 0 1 1 0;...
               0 0 0 0; 0 1 0 0; 0 1 1 0];

visibles_10 = [0 1 0 1 0 0 1 0 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

% img6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
              %
               0 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
              %
               1 1 1 1 1 1 0 0 1;...
               0 1 1 0 0 0 1 1 1;...
               1 0 1 0 0 1 1 1 0];

visibles_28 = [0 1 0 0; 1 0 0 0; 1 1 1 0; 0 1 1 0;...
               0 0 1 0; 0 0 1 0; 0 1 1 0];

visibles_10 = [0 1 0 1 1 1 0 0 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

% img7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visibles_81 = [0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
               0 0 0 1 1 1 1 1 1;...
              %
               0 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
               1 1 1 1 1 1 1 1 1;...
              %
               1 1 1 1 1 1 1 1 1;...
               0 1 1 0 0 0 1 1 1;...
               1 0 1 0 0 1 1 1 0];

visibles_28 = [0 1 0 0; 1 1 0 0; 1 1 0 0; 1 1 0 0;...
               0 0 0 0; 1 0 0 0; 1 1 0 0];

visibles_10 = [0 0 1 0 1 1 1 0 1 1];

visibles{end+1} = [reshape(visibles_81', [81, 1]); reshape(visibles_28', [28, 1])];
blocksV{end+1} = [reshape(visibles_28', [28, 1]); reshape( visibles_10', [10, 1])];

save('subset1/wheretoselect.mat', 'visibles', 'blocksV');
