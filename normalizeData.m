function [ norm_row, norm_colum ] = normalizeData( data, type)
%NORMALIZE ��һ��
%   �ò�ͬ�����������������һ������.
%   ���������С��һ����type=1����Z-Score��һ��(type=2),L2������һ��(type=3)
[m n]=size(data);
switch type
    case 1
        for i=1:m
            norm_row(i,:)=mapminmax(data(i,:),0,1);
        end
        for i=1:n
            norm_colum(:,i)=mapminmax(data(:,i)',0,1)';
        end
    case 2
        for i=1:m
            norm_row(i,:)=mapstd(data(i,:),0,1);
        end
        for i=1:n
            norm_colum(:,i)=mapstd(data(:,i)',0,1)';
        end
    case 3
        for i=1:m
            norm_row(i,:)=data(i,:)/norm(data(i,:));%�й�һ��
        end
        for i=1:n
            norm_colum(:,i)=data(:,i)/norm(data(:,i));%�й�һ��
        end
end
end

