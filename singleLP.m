clear;clc;

% 通过各种方式控制图片大小为(2^N）的倍数，这里采取N层金字塔。设置N到blend中。
Itest = imread('test.png');

Image = im2single(Itest);

Igray = rgb2gray(Image);

[M, N, ~] = size(Image);

% 预设金字塔的层数
Level = 4;

% 分配一个元胞，用于存储gauss金字塔
gauss = cell(1, Level);

% 分配元胞用于存储拉普拉斯金字塔
laplace = cell(1, Level);

gauss{1} = Igray;

% 构建高斯金字塔和拉普拉斯金字塔
for i=2:Level
    gauss{i} = pryDown(gauss{i-1});
    laplace{i-1} = gauss{i-1} - pryUp(gauss{i});
end

laplace{Level} = gauss{Level};

% 展示金字塔
for i=1:Level
    figure;
    imshow(gauss{i});
    figure;
    imshow(laplace{i}); 
end


% 拉普拉斯金字塔重构

RES_rebuild = cell(1, Level);

RES_rebuild{Level} = laplace{Level};

for i=Level-1:-1:1
    RES_rebuild{i} = pryUp(RES_rebuild{i+1}) + laplace{i};
end

res = RES_rebuild{1};

figure;
imshow(res);
