function [ totalConsumer ] = getTotalConsumer( file )
%��ȡ�����û�ID�������ݸ�����ռ��
%   fileΪԭ�����û������ļ�����totalConsumerΪ�����û�ID���󣬹����У���һ��Ϊ�û�ID���ڶ���Ϊ��ID�����������,������Ϊ��Ŀռ�ȡ�
totalConsumer=tabulate(file(:,1)); %tabulateΪȥ�غ���
b=find(totalConsumer(:,2));
totalConsumer=totalConsumer(b,:);
end

