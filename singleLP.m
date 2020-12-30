clear;clc;

% ͨ�����ַ�ʽ����ͼƬ��СΪ(2^N���ı����������ȡN�������������N��blend�С�
Itest = imread('test.png');

Image = im2single(Itest);

Igray = rgb2gray(Image);

[M, N, ~] = size(Image);

% Ԥ��������Ĳ���
Level = 4;

% ����һ��Ԫ�������ڴ洢gauss������
gauss = cell(1, Level);

% ����Ԫ�����ڴ洢������˹������
laplace = cell(1, Level);

gauss{1} = Igray;

% ������˹��������������˹������
for i=2:Level
    gauss{i} = pryDown(gauss{i-1});
    laplace{i-1} = gauss{i-1} - pryUp(gauss{i});
end

laplace{Level} = gauss{Level};

% չʾ������
for i=1:Level
    figure;
    imshow(gauss{i});
    figure;
    imshow(laplace{i}); 
end


% ������˹�������ع�

RES_rebuild = cell(1, Level);

RES_rebuild{Level} = laplace{Level};

for i=Level-1:-1:1
    RES_rebuild{i} = pryUp(RES_rebuild{i+1}) + laplace{i};
end

res = RES_rebuild{1};

figure;
imshow(res);
