
%imshow(I);
% �����м�ָ�Ķ�ά��ģ

% gaussFilterA = fspecial('gaussian',[5 5], sigmaA);
% gaussFilterO = fspecial('gaussian',[5 5],sigmaO);
% �⺯��kernel = fspecial(type, parameter, sigma) ����Ԥ������˲�����
% 'gaussian'Ϊ��˹��ͨ�˲����� ������������
% ģ��ߴ�Ĭ��[3 3]��
% sigma�˲����ı�׼���λ���أ�Ĭ��0.5
% ����һ�������ӣ��˾���

% blurA = imfilter(grayImgA, gaussFilterA, 'replicate');
% blurO = imfilter(grayImgO, gaussFilterO, 'replicate');
% �⺯��g = imfilter(f, w, filtering_mode, boundary_options, size_options)
% ����������������άͼ������˲�
% f������ͼ��w���˲�ģ�壬����g���˲����
% �˲�ģʽfiltering_mode����corr��ͨ���������ɣ�Ĭ�ϣ���'conv'ͨ�����
% �߽�ѡ��boundary_options����replicate��ͼ���Сͨ��������߽��ֵ����չ
% ��Сѡ��size_options�����ͼ��Ĵ�С��full��same







