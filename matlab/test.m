dir = 'C:\Users\nsleheen\Documents\motion_sense_test\9-20\raw\autosense_motionsense\';
ms_accel=csvread([dir 'MOTION_ACCL.csv']);
aw_accel_x=csvread([dir 'AUTO_ACCL_X.csv']);
aw_accel_y=csvread([dir 'AUTO_ACCL_Y.csv']);
aw_accel_z=csvread([dir 'AUTO_ACCL_Z.csv']);
% 
% mb_gyro=csvread([dir 'GYROSCOPE_RIGHT_WRIST_MICROSOFT_BAND.csv']);
% ms_gyro=csvread([dir 'GYROSCOPE_RIGHT_WRIST_MOTION_SENSE.csv']);
% aw_gyro_x=csvread([dir 'GYROSCOPE_X_LEFT_WRIST_AUTOSENSE_WRIST.csv']);
% aw_gyro_y=csvread([dir 'GYROSCOPE_Y_LEFT_WRIST_AUTOSENSE_WRIST.csv']);
% aw_gyro_z=csvread([dir 'GYROSCOPE_Z_LEFT_WRIST_AUTOSENSE_WRIST.csv']);
% 


plot(aw_accel_x(:,1), aw_accel_x(:,3), 'b');
hold on;
plot(ms_accel(:,1), ms_accel(:,3), 'g');
hold on;

plot(aw_accel_y(:,1), 3+aw_accel_y(:,3), 'b');
hold on;
plot(ms_accel(:,1), 3-ms_accel(:,4), 'g');
hold on;

plot(aw_accel_z(:,1), 6+aw_accel_z(:,3), 'b');
hold on;
plot(ms_accel(:,1), 6-ms_accel(:,5), 'g');
hold on;

legend('Accelerometer (AutoSense)', 'Accelerometer (Motion sense)');
