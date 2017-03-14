% dir='C:\Users\nsleheen\DATA\data_collected_for_activity\joy\01292017\';
% 
% 
% filename = 'context_label_walking.txt';
% l_w = importdata([dir filename]);
% for i=1:length(l_w)
%     rectangle('Position',[l_w(i, 1),0,l_w(i, 2)-l_w(i, 1),150],'FaceColor',[1 .5 .5]);
% %     plot([l_w(i, 1), l_w(i, 2)], [50, 50]);
%     hold on;
% end
% 
% filename = 'context_label_running.txt';
% l_w = importdata([dir filename]);
% for i=1:length(l_w)
% %     plot([l_w(i, 1), l_w(i, 2)], [100, 100]);
%     rectangle('Position',[l_w(i, 1),0,l_w(i, 2)-l_w(i, 1),150],'FaceColor',[1 1 .7]);
%     
%     hold on;
% end
% filename = 'context_label_Driving.txt';
% l_w = importdata([dir filename]);
% for i=1:length(l_w)
% %     plot([l_w(i, 1), l_w(i, 2)], [100, 100]);
%     rectangle('Position',[l_w(i, 1),0,l_w(i, 2)-l_w(i, 1),150],'FaceColor',[0.6 1 .7]);
%     
%     hold on;
% end
% filename = 'context_label_turn.txt';
% l_w = importdata([dir filename]);
% plot(l_w(:, 1), 160+l_w(:, 2)*30, '*');
% 
% filename = 'org.md2k.cstress.data.ecg.rr.heartrate.csv';
% 
% hr = importdata([dir filename]);
% 
% plot(hr(:, 1), hr(:, 2), '.');
% 
% % y = smooth(hr(:, 2));
% % 
% % y=movmean(hr(:, 2),3);
% hold on;
% 
% windowSize = 30;
% x=hr(:, 2);
% b = (1/windowSize)*ones(1,windowSize);
% a = 1;
% y = filter(b,a,x);
% plot(hr(:, 1), y);
% hold on;
% 
% filename = 'org.md2k.cstress.data.accel.magnitude.csv';
% mag = importdata([dir filename]);
% plot(mag(:, 1), (mag(:, 2)/25)+50, '.');
% 

dir='C:\Users\nsleheen\DATA\data_collected_for_activity\sakther\01292017\';
filename = 'context_label_walking.txt';
l_w = importdata([dir filename]);
for i=1:length(l_w)
    rectangle('Position',[l_w(i, 1),0+200,l_w(i, 2)-l_w(i, 1),150],'FaceColor',[1 .5 .5]);
%     plot([l_w(i, 1), l_w(i, 2)], [50, 50]);
    hold on;
end

filename = 'context_label_running.txt';
l_w = importdata([dir filename]);
for i=1:length(l_w)
%     plot([l_w(i, 1), l_w(i, 2)], [100, 100]);
    rectangle('Position',[l_w(i, 1),0+200,l_w(i, 2)-l_w(i, 1),150],'FaceColor',[1 1 .7]);
    
    hold on;
end
filename = 'context_label_Driving.txt';
l_w = importdata([dir filename]);
for i=1:length(l_w)
%     plot([l_w(i, 1), l_w(i, 2)], [100, 100]);
    rectangle('Position',[l_w(i, 1),200,l_w(i, 2)-l_w(i, 1),150],'FaceColor',[0.6 1 .7]);
    
    hold on;
end

filename = 'org.md2k.cstress.data.ecg.rr.heartrate.csv';
hr = importdata([dir filename]);
plot(hr(:, 1), hr(:, 2)+200, '.');
hold on;
windowSize = 30;
x=hr(:, 2);
b = (1/windowSize)*ones(1,windowSize);
a = 1;
y = filter(b,a,x);
plot(hr(:, 1), y+200);
grid on;

filename = 'org.md2k.cstress.data.accel.magnitude.csv';
mag = importdata([dir filename]);
plot(mag(:, 1), (mag(:, 2)/25)+250, '.');



filename = 'left-wrist-accelx.csv';
lax = importdata([dir filename]);
plot(lax(:, 1), (lax(:, 2)*10)+450);
filename = 'left-wrist-accely.csv';
lay= importdata([dir filename]);
plot(lay(:, 1), (lay(:, 2)*10)+500);
filename = 'left-wrist-accelz.csv';
laz = importdata([dir filename]);
plot(laz(:, 1), (laz(:, 2)*10)+550);

lmag = lax(:,2).*lax(:,2);
lmag=lmag+lay(:,2).*lay(:,2);
lmag=lmag+laz(:,2).*laz(:,2);
lmag = sqrt(lmag);
plot(laz(:, 1), (lmag(:, 1)*10)+400, '.');

% filename = 'right-wrist-accelx.csv';
% mag = importdata([dir filename]);
% plot(mag(:, 1), (mag(:, 2)*10)+500);
% filename = 'right-wrist-accely.csv';
% mag = importdata([dir filename]);
% plot(mag(:, 1), (mag(:, 2)*10)+500);
% filename = 'right-wrist-accelz.csv';
% mag = importdata([dir filename]);
% plot(mag(:, 1), (mag(:, 2)*10)+500);

filename = 'context_label_turn.txt';
l_w = importdata([dir filename]);
plot(l_w(:, 1), 400+l_w(:, 2)*30, '*');

text(hr(1, 1)-600000, 280, 'Heart rate', 'FontSize', 24)
text(hr(1, 1)-600000, 380, 'Accl Mag (Chest)', 'FontSize', 24)
text(hr(1, 1)-600000, 420, 'Accl Mag (left wrist)', 'FontSize', 24)
text(hr(1, 1)-600000, 450, 'Accl X (left wrist)', 'FontSize', 24)
text(hr(1, 1)-600000, 500, 'Accl Y (left wrist)', 'FontSize', 24)
text(hr(1, 1)-600000, 550, 'Accl Z (left wrist)', 'FontSize', 24)
