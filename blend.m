function res = blend(scA, scB, maskB)
    %% �������� 
     
    % ���ĳһͨ�����ںϹ�����
    % �������룺sc��single channel��ͨ����scA��scB�ֱ����Ҫ�ںϵ�ͼ��maskB����ֵ��ģ��
    % �����res���ں���ϵ�ͼ��
    % -----------------------------------------------------------------
    
    %% ����scA��scB��������˹������LA��LB �� ��ֵ��ģͼ��ĸ�˹������GmaskB
    
    % Ԥ��������Ĳ���
    N = 9;
    
    % ����һ��Ԫ�������ڴ洢gauss������
    gaussA = cell(1,N);
    gaussB = cell(1,N);
    
    % ����Ԫ�����ڴ洢������˹������
    laplaceA = cell(1,N);
    laplaceB = cell(1,N);
    
    % ����Ԫ�����ڴ洢��ֵ��ģ��˹������
    gaussGmaskB = cell(1,N);
    
    % ��ʼ��
    gaussA{1} = scA;
    gaussB{1} = scB;
    gaussGmaskB{1} = maskB;
    
    % ������˹��������������˹������
    for i=2:N
        gaussA{i} = pryDown(gaussA{i-1});
        laplaceA{i-1} = gaussA{i-1} - pryUp(gaussA{i});
        
        gaussB{i} = pryDown(gaussB{i-1});
        laplaceB{i-1} = gaussB{i-1} - pryUp(gaussB{i});
        
        gaussGmaskB{i} = pryDown(gaussGmaskB{i-1});
    end
    
    laplaceA{N} = gaussA{N};
    laplaceB{N} = gaussB{N};
    
    %% �Ͷ�ֵ��ģͼ����в�ֵ��RES������˹������
    
    RES = cell(1,N);
    
    for i=1:N
        RES{i} = laplaceA{i} .* gaussGmaskB{i} + laplaceB{i} .* (1 - gaussGmaskB{i});
    end
    
    
    %% ��ֵ���RES������˹�����������ؽ���ԭ
    
    RES_rebuild = cell(1,N);
    
    RES_rebuild{N} = RES{N};
    
    for i=N-1:-1:1
        RES_rebuild{i} = pryUp(RES_rebuild{i+1}) + RES{i};
    end
    
    res = RES_rebuild{1};
end