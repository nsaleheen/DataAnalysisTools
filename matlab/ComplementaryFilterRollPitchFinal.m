clear all;
dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p01\s03\';

start_time = -1;
end_time = -1;

gt= importdataSE([dir 'puffGroundtruth.csv'], start_time, end_time);

start_time = gt(1, 1);
end_time = start_time+ 5*60*1000;

gt= importdataSE([dir 'puffGroundtruth.csv'], start_time, end_time);

% accelx = importdataSE([dir 'left-wrist-accelx.csv'], start_time, end_time);
% accely = importdataSE([dir 'left-wrist-accely.csv'], start_time, end_time);
% accelz = importdataSE([dir 'left-wrist-accelz.csv'], start_time, end_time);
% gyrox = importdataSE([dir 'left-wrist-gyrox.csv'], start_time, end_time);
% gyroy = importdataSE([dir 'left-wrist-gyroy.csv'], start_time, end_time);
% gyroz = importdataSE([dir 'left-wrist-gyroz.csv'], start_time, end_time);
% r = importdataSE([dir 'org.md2k.puffmarker.data.wrist.roll.leftwrist.csv'], start_time, end_time);
% p = importdataSE([dir 'org.md2k.puffmarker.data.wrist.pitch.leftwrist.csv'], start_time, end_time);

accelx = importdataSE([dir 'right-wrist-accelx.csv'], start_time, end_time);
accely = importdataSE([dir 'right-wrist-accely.csv'], start_time, end_time);
accelz = importdataSE([dir 'right-wrist-accelz.csv'], start_time, end_time);
gyrox = importdataSE([dir 'right-wrist-gyrox.csv'], start_time, end_time);
gyroy = importdataSE([dir 'right-wrist-gyroy.csv'], start_time, end_time);
gyroz = importdataSE([dir 'right-wrist-gyroz.csv'], start_time, end_time);
r = importdataSE([dir 'org.md2k.puffmarker.data.wrist.roll.rightwrist.csv'], start_time, end_time);
p = importdataSE([dir 'org.md2k.puffmarker.data.wrist.pitch.rightwrist.csv'], start_time, end_time);

ts = accelx(:, 1);
acc_x = accelx(:, 2);
acc_y = accely(:, 2);
acc_z = accelz(:, 2);
gyr_x = gyrox(:, 2);
gyr_y = gyroy(:, 2);
gyr_z = gyroz(:, 2);
         
dt = 1/16.0;
M_PI =  3.14159265359	;
hpf = 0.90;
lpf = 0.10;

thetaX_acc = atan2(-acc_z,acc_y)*180/M_PI;
thetaY_acc = atan2(acc_x,acc_z)*180/M_PI;
thetaZ_acc = atan2(acc_y,acc_x)*180/M_PI;
    
thetaX = zeros(size(gyr_x));
thetaY= zeros(size(gyr_x));
thetaZ= zeros(size(gyr_x));
for a = 1:length(gyr_x)
    if a == 1
        thetaX(a) = hpf*thetaX(a)*dt + lpf*thetaX_acc(a);
        thetaY(a) = hpf*thetaY(a)*dt + lpf*thetaY_acc(a);
        thetaZ(a) = hpf*thetaZ(a)*dt + lpf*thetaZ_acc(a);
    else
        thetaX(a) = hpf*(thetaX(a-1) + gyr_x(a)*dt) + lpf*thetaX_acc(a);
        thetaY(a) = hpf*(thetaY(a-1) + gyr_y(a)*dt) + lpf*thetaY_acc(a);
        thetaZ(a) = hpf*(thetaZ(a-1) + gyr_z(a)*dt) + lpf*thetaZ_acc(a);
    end
end
figure
plot(ts, thetaX)
hold on
plot(ts, thetaX_acc)
plot(ts, 400+thetaY)
plot(ts, 400+thetaY_acc)

plot(ts, 800+thetaZ)
plot(ts, 800+thetaZ_acc)
legend('X','Y','Z')
for i=1:length(gt)
    plot([gt(i, 1) gt(i, 1)], [-100 1000], '--');
end

plot(r(:, 1), 1000+r(:, 2), '.')
plot(p(:, 1), 1200+p(:, 2), '.')

% pitch = [];
% pitch = [pitch gyrox(1)*dt];
% roll = [];
% roll = [roll gyroy(1)*dt];
% yaw = [];
% yaw = [yaw gyroz(1)*dt];
% for i=2:length(gyrox)
%    pitch = [pitch pitch(i-1)+gyrox(i)*dt];
%    roll = [roll roll(i-1)+gyroy(i)*dt];
%    yaw = [yaw yaw(i-1)+gyroz(i)*dt];
% end
% pitch = pitch';
% roll=roll';
% yaw = yaw';
% pitchAcc = atan2(accely, accelz) * 180 / M_PI;
% pitchC = pitch * 0.98 + pitchAcc * 0.02;
% 
% rollAcc = atan2(accelx, accelz) * 180 / M_PI;
% rollC = roll * 0.98 + rollAcc * 0.02;
% 
% yawAcc = atan2(accelx, accely) * 180 / M_PI;
% yawC = yaw * 0.98 + yawAcc * 0.02;
% 
% plot(ts, yawAcc);hold on;
% plot(ts, 400+rollAcc);
% plot(ts, 800+pitchAcc);

% legend('yaw', 'roll', 'pitch')