clear all;
dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p06\s01\';

start_time = 1409127825515;
end_time = 1409127825515 + 60*1000;

% start_time = -1;
% end_time = -1;


% accelx = importdataSE([dir 'left-wrist-accelx.csv'], start_time, end_time);
% accely = importdataSE([dir 'left-wrist-accely.csv'], start_time, end_time);
% accelz = importdataSE([dir 'left-wrist-accelz.csv'], start_time, end_time);
% gyrox = importdataSE([dir 'left-wrist-gyrox.csv'], start_time, end_time);
% gyroy = importdataSE([dir 'left-wrist-gyroy.csv'], start_time, end_time);
% gyroz = importdataSE([dir 'left-wrist-gyroz.csv'], start_time, end_time);

accelx = importdataSE([dir 'right-wrist-accelx.csv'], start_time, end_time);
accely = importdataSE([dir 'right-wrist-accely.csv'], start_time, end_time);
accelz = importdataSE([dir 'right-wrist-accelz.csv'], start_time, end_time);
gyrox = importdataSE([dir 'right-wrist-gyrox.csv'], start_time, end_time);
gyroy = importdataSE([dir 'right-wrist-gyroy.csv'], start_time, end_time);
gyroz = importdataSE([dir 'right-wrist-gyroz.csv'], start_time, end_time);



gt= importdataSE([dir 'puffGroundtruth.csv'], start_time, end_time);


ts = accelx(:, 1);
accelx = accelx(:, 2);
accely = accely(:, 2);
accelz = accelz(:, 2);
gyrox = gyrox(:, 2);
gyroy = gyroy(:, 2);
gyroz = gyroz(:, 2);
         
dt = 1/16.0;
M_PI =  3.14159265359	;


pitch = [];
pitch = [pitch gyrox(1)*dt];
roll = [];
roll = [roll gyroy(1)*dt];
yaw = [];
yaw = [yaw gyroz(1)*dt];
for i=2:length(gyrox)
   pitch = [pitch pitch(i-1)+gyrox(i)*dt];
   roll = [roll roll(i-1)+gyroy(i)*dt];
   yaw = [yaw yaw(i-1)+gyroz(i)*dt];
end
pitch = pitch';
roll=roll';
yaw = yaw';
pitchAcc = atan2(accely, accelz) * 180 / M_PI;
pitchC = pitch * 0.98 + pitchAcc * 0.02;

rollAcc = atan2(accelx, accelz) * 180 / M_PI;
rollC = roll * 0.98 + rollAcc * 0.02;

yawAcc = atan2(accelx, accely) * 180 / M_PI;
yawC = yaw * 0.98 + yawAcc * 0.02;

plot(ts, yawAcc);hold on;
plot(ts, 400+rollAcc);
plot(ts, 800+pitchAcc);
for i=1:length(gt)
    plot([gt(i, 1) gt(i, 1)], [-100 1000], '--');
end
legend('yaw', 'roll', 'pitch')