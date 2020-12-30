clear;clc;

% 体会直接删除偶数行列的效果

% 通过各种方式控制图片大小为(2^N）的倍数，这里采取N层金字塔。设置N到blend中。
Itest = imread('1.jpg');

Image = im2single(Itest);

Igray = rgb2gray(Image);

[M, N, ~] = size(Image);


resA = Igray(1:2:end,1:2:end);
resB = pryDown(Igray);
figure;
imshow(resA);
figure;
imshow(resB);
