
%imshow(I);
% 创建中间分割的二维掩模

% gaussFilterA = fspecial('gaussian',[5 5], sigmaA);
% gaussFilterO = fspecial('gaussian',[5 5],sigmaO);
% 库函数kernel = fspecial(type, parameter, sigma) 创建预定义的滤波算子
% 'gaussian'为高斯低通滤波器， 两个参数——
% 模板尺寸默认[3 3]；
% sigma滤波器的标准差，单位像素，默认0.5
% 返回一个（算子）核矩阵

% blurA = imfilter(grayImgA, gaussFilterA, 'replicate');
% blurO = imfilter(grayImgO, gaussFilterO, 'replicate');
% 库函数g = imfilter(f, w, filtering_mode, boundary_options, size_options)
% 对任意类型数组或多维图像进行滤波
% f是输入图像，w是滤波模板，返回g是滤波结果
% 滤波模式filtering_mode，‘corr’通过相关来完成（默认），'conv'通过卷积
% 边界选项boundary_options，‘replicate’图像大小通过复制外边界的值来扩展
% 大小选项size_options，输出图像的大小。full和same







