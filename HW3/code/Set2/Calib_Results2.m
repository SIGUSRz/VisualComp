% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2546.313896955728069 ; 3398.079541617456925 ];

%-- Principal point:
cc = [ 1377.371841870987282 ; 2636.792726490101813 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.009769207739443 ; -0.017437334145043 ; -0.014423021134874 ; -0.008160042497238 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 148.888926114053362 ; 389.319015587593469 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.057708330877417 ; 0.072541839549600 ; 0.012309567460988 ; 0.004947382380421 ; 0.000000000000000 ];

%-- Image size:
nx = 2848;
ny = 2136;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 16;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.772008e+00 ; -1.760194e+00 ; 6.677933e-01 ];
Tc_1  = [ 1.030035e+02 ; -4.459582e+01 ; 2.042367e+02 ];
omc_error_1 = [ 3.642247e-02 ; 3.500119e-02 ; 4.961903e-02 ];
Tc_error_1  = [ 3.860751e-01 ; 2.631886e+00 ; 1.234286e+01 ];
romc_1 = rotationVectorToMatrix(omc_1);
rotations{1} = romc_1;
translations{1} = Tc_1;


%-- Image #3:
omc_3 = [ 6.535472e-01 ; -2.600024e+00 ; 1.073487e+00 ];
Tc_3  = [ 1.446971e+02 ; -1.400691e+02 ; 2.669963e+02 ];
omc_error_3 = [ 1.115099e-02 ; 3.495272e-02 ; 7.265594e-02 ];
Tc_error_3  = [ 5.209643e-01 ; 7.794038e+00 ; 1.640862e+01 ];
romc_3 = rotationVectorToMatrix(omc_3);
rotations{2} = romc_3;
translations{2} = Tc_3;

%-- Image #7:
omc_7 = [ 1.151254e+00 ; 2.408116e+00 ; -9.956095e-01 ];
Tc_7  = [ 1.489523e+01 ; -1.924751e+02 ; 3.275332e+02 ];
omc_error_7 = [ 2.109171e-02 ; 4.712343e-02 ; 5.876773e-02 ];
Tc_error_7  = [ 8.980004e-01 ; 1.079161e+01 ; 1.887370e+01 ];
romc_7 = rotationVectorToMatrix(omc_7);
rotations{3} = romc_7;
translations{3} = Tc_7;

%-- Image #14:
omc_14 = [ 1.983947e+00 ; 1.122560e+00 ; -6.392658e-01 ];
Tc_14  = [ -1.128349e+02 ; -1.103238e+02 ; 2.749367e+02 ];
omc_error_14 = [ 4.348071e-02 ; 2.570279e-02 ; 1.788550e-02 ];
Tc_error_14  = [ 5.095711e-01 ; 6.659735e+00 ; 1.437379e+01 ];
romc_14 = rotationVectorToMatrix(omc_14);
rotations{4} = romc_14;
translations{4} = Tc_14;

%-- Image #16:
omc_16 = [ 2.332057e+00 ; 8.317958e-01 ; -3.620218e-01 ];
Tc_16  = [ -1.120522e+02 ; -9.882823e+01 ; 2.657444e+02 ];
omc_error_16 = [ 5.670382e-02 ; 2.216365e-02 ; 1.655269e-02 ];
Tc_error_16  = [ 3.981601e-01 ; 5.783415e+00 ; 1.435291e+01 ];
romc_16 = rotationVectorToMatrix(omc_16);
rotations{5} = romc_16;
translations{5} = Tc_16;
