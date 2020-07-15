function Img = Gauss(Image, flag)
    %% 函数介绍 
     
    % 完成对图像Image的高斯滤波
    % 参数输入：Image即输入图像，flag为1则判定是下采样的gauss滤波，为0则判定是上采样的gauss滤波
    % 输出：Img，滤波完毕后的图像。
    % -----------------------------------------------------------------
    
    %% 高斯滤波的实现
    
    [M, N] = size(Image);
    
    Num = 16.0;
    
    % 若为0，则上采样时要对滤波高斯核进行扩大。
    if flag == 0
        Num = 8.0;
    end
    
    %  手动制作5*5的卷积核，此处为行向量
    kernel = [1,4,6,4,1] / Num;
    
    % 对图像进行预处理，即扩展——增加padding
    Image_E = zeros(M + 4, N+4);
    Image_E(3:end-2,3:end-2) = Image;
    
    % 进行滤波操作
    % 进行行滤波,tmpImage_E用于存放中间结果
    tmpImage_E = zeros(M + 4, N+4);
    for i=3:M-2
        for j=3:N-2
            tmpImage_E(i,j) = Image_E(i,j-2:j+2) * kernel'; 
        end
    end
    % 用得到的中间结果tmpImage_E，进行列向滤波
    for j=3:N-2
        for i=3:M-2
            Image_E(i,j) = kernel * tmpImage_E(i-2:i+2,j); 
        end
    end
    
    Img = Image_E(3:end-2,3:end-2);
    
end