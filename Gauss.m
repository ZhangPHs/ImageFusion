function Img = Gauss(Image, flag)
    %% �������� 
     
    % ��ɶ�ͼ��Image�ĸ�˹�˲�
    % �������룺Image������ͼ��flagΪ1���ж����²�����gauss�˲���Ϊ0���ж����ϲ�����gauss�˲�
    % �����Img���˲���Ϻ��ͼ��
    % -----------------------------------------------------------------
    
    %% ��˹�˲���ʵ��
    
    [M, N] = size(Image);
    
    Num = 16.0;
    
    % ��Ϊ0�����ϲ���ʱҪ���˲���˹�˽�������
    if flag == 0
        Num = 8.0;
    end
    
    %  �ֶ�����5*5�ľ���ˣ��˴�Ϊ������
    kernel = [1,4,6,4,1] / Num;
    
    % ��ͼ�����Ԥ��������չ��������padding
    Image_E = zeros(M + 4, N+4);
    Image_E(3:end-2,3:end-2) = Image;
    
    % �����˲�����
    % �������˲�,tmpImage_E���ڴ���м���
    tmpImage_E = zeros(M + 4, N+4);
    for i=3:M-2
        for j=3:N-2
            tmpImage_E(i,j) = Image_E(i,j-2:j+2) * kernel'; 
        end
    end
    % �õõ����м���tmpImage_E�����������˲�
    for j=3:N-2
        for i=3:M-2
            Image_E(i,j) = kernel * tmpImage_E(i-2:i+2,j); 
        end
    end
    
    Img = Image_E(3:end-2,3:end-2);
    
end