clear;clc;

% ���ֱ��ɾ��ż�����е�Ч��

% ͨ�����ַ�ʽ����ͼƬ��СΪ(2^N���ı����������ȡN�������������N��blend�С�
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
