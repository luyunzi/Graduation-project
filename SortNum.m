function [ out ] = SortNum( in )
%   ��������������
temp=in(:,2);
[c,pos]=sort(temp);
in(:,[1 3])=in(pos,[1 3]);
in(:,2)=c;
out=in;

end

