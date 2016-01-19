%����c++��matlab��ϱ�̣���ɻ���pca�����ɷݷ����㷨������ֵ��������
%       �ؼ��֣�c++��matlab��pca 
function GRpca424(input)
%inputΪ��������ԭʼ����
%eigenValue�����ɷݷ����������õ���ԭʼ���������ֵ�������ɴ�С��˳�������
%eigenVector�����ɷַ�������õ��Ķ�Ӧ����ֵ��������������ÿ��Ϊ��Ӧ��
x=importdata('C:\matlab\infile.txt');
input=x;
[n,p]=size(input);
 
%��ÿһ�е�ƽ��ֵ��������ƽ��ֵ����������x2��
 
x=input;
for j=1:p
    x1(j,1)=input(1,j);
    for i=2:n
        x1(j,1)=x1(j,1)+input(i,j);
    end
    x2(j,1)=x1(j,1)/n;
end
 
 
%�����������б�׼���������
 
for j=1:p
    s1(j,1)=(input(1,j)-x2(j,1))*(input(1,j)-x2(j,1));
    for i=2:n
        s1(j,1)=s1(j,1)+(input(i,j)-x2(j,1))*(input(i,j)-x2(j,1));
    end
    s(j,1)=sqrt(s1(j,1)/(n-1));
end
for i=1:n
    for j=1:p
        standard(i,j)=(input(i,j)-x2(j,1))/s(j,1);
    end
end
 
 
%�����ϵ������cormatrix
for j=1:p
    Ave1(j,1)=standard(1,j);
    for i=2:n
        Ave(j,1)=Ave1(j,1)+standard(i,j);
    end
    Ave(j,1)=Ave(j,1)/n;%standard��ƽ��ֵ
end
 
for i=1:n
    ave1(i,1)=standard(i,1);
    for j=2:p
        ave(i,1)=ave1(i,1)+standard(i,j);
    end
    ave(i,1)=ave(i,1)/p;%standard��ƽ��ֵ
end
 
if n>p
    for i=1:p
        for j=1:p
            Rsum(i,j)=(standard(1,i)-ave(i,1))*(standard(1,j)-Ave(j,1));
            for l=2:n
                Rsum(i,j)=Rsum(i,j)+(standard(l,i)-ave(i,1))*(standard(l,j)-
Ave(j,1));
            end
        end
    end
    for i=1:p
        for j=1:p
            Cov(i,j)=Rsum(i,j)/(n-1);
        end
    end
    for i=1:p
        for j=1:p
            corMatrix(i,j)=Cov(i,j)/(sqrt(Cov(i,i))*sqrt(Cov(j,j)));
        end
    end
end
 
corMatrix
 
 
%�������ϵ�����������ֵ����������
disp('EigenVectorΪ�����������ɵı�׼����������EigenvalueΪ����ֵ');
[EigenVector,Eigenvalue]=eig(corMatrix);
%��EigenVector��Eigenvalue��������������ֵ���մӴ�С��˳���������
if n>p
    g=p;
end
if n<=p
    g=n;
end
for i=1:(g-1)
    if Eigenvalue(i,i)<Eigenvalue(i+1,i+1)
        t=Eigenvalue(i,i);
        Eigenvalue(i,i)=Eigenvalue(i+1,i+1);
        Eigenvalue(i+1,i+1)=t;
        for j=1:g
            s=EigenVector(j,i);
            EigenVector(j,i)=EigenVector(j,i+1);
            EigenVector(j,i+1)=s;
        end
    end
end
Eigenvalue
EigenVector
for i=1:g
    eigenValue(i,1)=Eigenvalue(i,i);
end
eigenValue
%��������������
[m]=size(eigenValue);
%������ɷݵ�����ֵ�����и����Ļ����ͽ���ȡ�෴����
for i=1:m
    if eigenValue(i,1)<0
        eigenValue(i,1)=-eigenValue(i,1)
    end
end
%�������ķ�����ʱ�����main��
subM=0;
for i=1:m
    subM=subM+eigenValue(i,1);
end
for i=1:m
    main(i,1)=eigenValue(i,1)/subM;
end
disp('�������ķ�������ǣ�');
main
 
%�����ɷݷ������������ı�
dlmwrite('c:\matlab\�������.txt',main,'precision','%
10.5f','newline','pc');
 
%�����ɷ���ռ�ٷֱȽ��б����������������û����õ�Ȩ�����������յ����ɷ��ж�
y=importdata('C:\matlab\var.txt');
n=y;%�û�ͨ��C++�������涨��Ĵ��ķ������
k=main(1,1);
for i=1:m-1
    if k>=n
        disp('���ɷ���������Ϊ��');
        m=i;
        m
        break;
    else
        k=k+main(i+1,1);
    end
end
k=0;
for s=1:i
    k=k+main(s,1);
end
 
%����������������б�׼��������ת��ΪVector
[p,p]=size(EigenVector);
x=EigenVector;
for j=1:p
    x1(j,1)=EigenVector(1,j);
    for i=2:p
        x1(j,1)=x1(j,1)+EigenVector(i,j);
    end
    x2(j,1)=x1(j,1)/p;
end
for j=1:p
    v1(j,1)=(EigenVector(1,j)-x2(j,1))*(EigenVector(1,j)-x2(j,1));
    for i=2:p
        v1(j,1)=s1(j,1)+(EigenVector(i,j)-x2(j,1))*(EigenVector(i,j)-x2
(j,1));
    end
    v(j,1)=sqrt(v1(j,1)/(p-1));
end
for i=1:p
    for j=1:p
        Vector(i,j)=(EigenVector(i,j)-x2(j,1))/v(j,1);
    end
end
 
%���������ɷ�ֵ����Ϊ
if m<=p
    for i=1:m
        for j=1:p
            vector(j,i)=Vector(j,i);
        end
    end
end
 
F=standard*vector;
%FΪ��������Ǿ����仯֮���������ɷݷ���ֵ��������;�ɸ��ݹ���ʵ����Ҫ��
��
%��F�����ָ�����ļ���
dlmwrite('c:\matlab\���ɷݾ���.txt',F,'precision','%10.5f','-
append','newline','pc');
