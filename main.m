data = rand(100,2); 
options = [2;100;1e-5;1]; 
[center,U,obj_fcn] = FCM(data,2,options); 
figure; 
plot(data(:,1), data(:,2),'o'); 
title('DemoTest of FCM Cluster'); 
xlabel('1st Dimension'); 
ylabel('2nd Dimension'); 
grid on; 
hold on; 
maxU = max(U); 
index1 = find(U(1,:) == maxU); 
index2 = find(U(2,:) == maxU); 
line(data(index1,1),data(index1,2),'marker','*','color','g'); 
line(data(index2,1),data(index2,2),'marker','*','color','r'); 
plot([center([1 2],1)],[center([1 2],2)],'*','color','k') 
hold off;