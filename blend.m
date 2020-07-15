function res = blend(scA, scB, maskB)
    %% 函数介绍 
     
    % 完成某一通道的融合工作。
    % 参数输入：sc即single channel单通道，scA和scB分别代表要融合的图，maskB即二值掩模。
    % 输出：res，融合完毕的图像。
    % -----------------------------------------------------------------
    
    %% 构建scA和scB的拉普拉斯金字塔LA和LB 与 二值掩模图像的高斯金字塔GmaskB
    
    % 预设金字塔的层数
    N = 9;
    
    % 分配一个元胞，用于存储gauss金字塔
    gaussA = cell(1,N);
    gaussB = cell(1,N);
    
    % 分配元胞用于存储拉普拉斯金字塔
    laplaceA = cell(1,N);
    laplaceB = cell(1,N);
    
    % 分配元胞用于存储二值掩模高斯金字塔
    gaussGmaskB = cell(1,N);
    
    % 初始化
    gaussA{1} = scA;
    gaussB{1} = scB;
    gaussGmaskB{1} = maskB;
    
    % 构建高斯金字塔和拉普拉斯金字塔
    for i=2:N
        gaussA{i} = pryDown(gaussA{i-1});
        laplaceA{i-1} = gaussA{i-1} - pryUp(gaussA{i});
        
        gaussB{i} = pryDown(gaussB{i-1});
        laplaceB{i-1} = gaussB{i-1} - pryUp(gaussB{i});
        
        gaussGmaskB{i} = pryDown(gaussGmaskB{i-1});
    end
    
    laplaceA{N} = gaussA{N};
    laplaceB{N} = gaussB{N};
    
    %% 和二值掩模图像进行插值得RES拉普拉斯金字塔
    
    RES = cell(1,N);
    
    for i=1:N
        RES{i} = laplaceA{i} .* gaussGmaskB{i} + laplaceB{i} .* (1 - gaussGmaskB{i});
    end
    
    
    %% 插值后的RES拉普拉斯金字塔进行重建还原
    
    RES_rebuild = cell(1,N);
    
    RES_rebuild{N} = RES{N};
    
    for i=N-1:-1:1
        RES_rebuild{i} = pryUp(RES_rebuild{i+1}) + RES{i};
    end
    
    res = RES_rebuild{1};
end