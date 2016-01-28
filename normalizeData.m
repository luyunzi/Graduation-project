function [ norm_row, norm_colum ] = normalizeData( data, type)
%NORMALIZE 归一化
%   用不同方法对输入矩阵做归一化处理.
%   包括最大最小归一化（type=1）、Z-Score归一化(type=2),L2范数归一化(type=3)
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
            norm_row(i,:)=data(i,:)/norm(data(i,:));%行归一化
        end
        for i=1:n
            norm_colum(:,i)=data(:,i)/norm(data(:,i));%列归一化
        end
end
end

