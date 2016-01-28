function [ oneConsumer ] = getOneConsumer( conID, file )
%根据某一用户ID获取该用户的所有用电数据，按时间排序
%conID为用户ID，file为原包含多个用户的矩阵
ind=find(file(:,1)==conID);
Consumer=file(ind,:);
oneConsumer=SortNum(Consumer);

end

