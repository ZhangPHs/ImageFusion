clear;clc;

% 通过各种方式控制图片大小为(2^N）的倍数，这里采取N层金字塔。设置N到blend中。
Iapple = imread('1.jpg');
Iorange = imread('2.jpg');

Apple = im2single(Iapple);
Orange = im2single(Iorange);

[M, N, ~] = size(Apple);
% imshow(Apple);

% 手动绘制二值掩模
maskB = zeros(M,N);
maskB(:,(N/2+1):end) = 1.0;
%maskB(M/4:M*3/4,N/4:N*3/4) = 1.0;
%maskB(M/2+1:end,:) = 1.0;
%for i=1:M
%    for j=1:N
%        if (i-M/2)^2+(j-N/2)^2 < (N/4)*(N/2)
%            maskB(i,j) = 1.0;
%        end
%    end
%end
%imshow(maskB);

% 对于rgb三通道，每一通道单独取出，分别进行一系列融合操作，最后再合并在一起。
redApple = Apple(:,:,1);
greenApple = Apple(:,:,2);
blueApple = Apple(:,:,3);

redOrange = Orange(:,:,1);
greenOrange = Orange(:,:,2);
blueOrange = Orange(:,:,3);

redBlend = blend(redOrange, redApple, maskB);
greenBlend = blend(greenOrange, greenApple, maskB);
blueBlend = blend(blueOrange, blueApple, maskB);

% 合并操作。
result = cat(3,redBlend,greenBlend,blueBlend);

imshow(result);







