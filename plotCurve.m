function[ret] = plotCurve( data )
% plot the curve
x=[1:48];
figure;
 hold on;
for i=1:length(data)/48
    plot(x,data(1+48*(i-1):i*48,3)');
    ret(i,1:48)=data(1+48*(i-1):i*48,3)';%dataΪת�����n*48�����飬nΪ�û���
end

end
    