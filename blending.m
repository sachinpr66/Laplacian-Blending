close all;
clear all;
clc
A = im2double(imread('orange.png'));
B = im2double(imread('apple.png'));
figure;
imshow(A);
figure;
imshow(B);
% mask that defines the blending region
R = im2double(imread('mask.png'));
% depth of the pyramids
depth = 5;

% 1) we build the Laplacian pyramids of the two images
LA = laplacianpyr(A,depth);
LB = laplacianpyr(B,depth);

% 2) we build the Gaussian pyramid of the selected region
GR = gausspyr(R,depth); 

% 3) we combine the two pyramids using the nodes of GR as weights
[LS] = combine(LA, LB, GR);

% 4) we collapse the output pyramid to get the final blended image
Ib = collapse(LS);

% visualization of the result
figure;
imshow(Ib);

imwrite(Ib,'result.png');