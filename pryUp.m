function res = pryUp(Image)
    %% 函数介绍 
     
    % 完成拉普拉斯金字塔构建中的上采样操作
    % 参数输入：输入的图像Image
    % 输出：得到Image的下一层图像
    % -----------------------------------------------------------------
    
    %% 实现
    
    [M, N] = size(Image);
     
    % 扩充图像，以0填补
    Image_E = zeros(M*2, N*2);
    Image_E(1:2:end,1:2:end) = Image;
    
    % 上采样高斯滤波，参数输入0
    res = Gauss(Image_E, 0);
    
end