function [ oneConsumer ] = getOneConsumer( conID, file )
%����ĳһ�û�ID��ȡ���û��������õ����ݣ���ʱ������
%conIDΪ�û�ID��fileΪԭ��������û��ľ���
ind=find(file(:,1)==conID);
Consumer=file(ind,:);
oneConsumer=SortNum(Consumer);

end

