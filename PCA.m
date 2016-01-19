%利用c++和matlab混合编程，完成基于pca（主成份分析算法）的数值分析程序。
%       关键字：c++、matlab、pca 
function GRpca424(input)
%input为待分析的原始矩阵
%eigenValue是主成份分析过后所得到的原始矩阵的特征值（按照由大到小的顺序给出）
%eigenVector是主成分分析过后得到的对应特征值的特征向量矩阵（每列为对应）
x=importdata('C:\matlab\infile.txt');
input=x;
[n,p]=size(input);
 
%求每一列的平均值，并将列平均值保存在向量x2中
 
x=input;
for j=1:p
    x1(j,1)=input(1,j);
    for i=2:n
        x1(j,1)=x1(j,1)+input(i,j);
    end
    x2(j,1)=x1(j,1)/n;
end
 
 
%对输入矩阵进行标准化计算过程
 
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
 
 
%求相关系数矩阵cormatrix
for j=1:p
    Ave1(j,1)=standard(1,j);
    for i=2:n
        Ave(j,1)=Ave1(j,1)+standard(i,j);
    end
    Ave(j,1)=Ave(j,1)/n;%standard列平均值
end
 
for i=1:n
    ave1(i,1)=standard(i,1);
    for j=2:p
        ave(i,1)=ave1(i,1)+standard(i,j);
    end
    ave(i,1)=ave(i,1)/p;%standard行平均值
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
 
 
%计算相关系数矩阵的特征值、特征向量
disp('EigenVector为特征向量构成的标准化正交矩阵；Eigenvalue为特征值');
[EigenVector,Eigenvalue]=eig(corMatrix);
%对EigenVector和Eigenvalue进行排序，是特征值按照从大到小的顺序进行排列
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
%计算分量方差贡献率
[m]=size(eigenValue);
%如果主成份的特征值矩阵有负数的话，就将其取相反数吧
for i=1:m
    if eigenValue(i,1)<0
        eigenValue(i,1)=-eigenValue(i,1)
    end
end
%各分量的方差贡献率保存在main中
subM=0;
for i=1:m
    subM=subM+eigenValue(i,1);
end
for i=1:m
    main(i,1)=eigenValue(i,1)/subM;
end
disp('各分量的方差贡献率是：');
main
 
%将主成份方差贡献率输出到文本
dlmwrite('c:\matlab\方差贡献率.txt',main,'precision','%
10.5f','newline','pc');
 
%对主成份所占百分比进行比例分析，并根据用户设置的权重数进行最终的主成份判定
y=importdata('C:\matlab\var.txt');
n=y;%用户通过C++交互界面定义的达标的方差贡献率
k=main(1,1);
for i=1:m-1
    if k>=n
        disp('主成份向量个数为：');
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
 
%对特征向量矩阵进行标准化，将其转化为Vector
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
 
%样本的主成份值矩阵为
if m<=p
    for i=1:m
        for j=1:p
            vector(j,i)=Vector(j,i);
        end
    end
end
 
F=standard*vector;
%F为输出矩阵，是经过变化之后的相关主成份分析值，具体用途可根据工程实际需要而
定
%将F输出到指定的文件中
dlmwrite('c:\matlab\主成份矩阵.txt',F,'precision','%10.5f','-
append','newline','pc');
