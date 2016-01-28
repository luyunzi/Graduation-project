function [ totalConsumer ] = getTotalConsumer( file )
%获取所有用户ID及总数据个数和占比
%   file为原所有用户数据文件矩阵，totalConsumer为所有用户ID矩阵，共三列，第一列为用户ID，第二列为该ID下数据项个数,第三个为数目占比。
totalConsumer=tabulate(file(:,1)); %tabulate为去重函数
b=find(totalConsumer(:,2));
totalConsumer=totalConsumer(b,:);
end

