clear all;
dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p01\s03\';
dir = 'C:\Users\nsleheen\DATA\RICE_TESTING\MICH\';

puff= importdata([dir 'PUFF_LABEL_CLOUD.csv']);
sm_epi= importdata([dir 'SMOKING_EPI_CLOUD.csv']);

start_time = sm_epi(2, 1)-10*60000;
end_time = sm_epi(2, 1)+20*60000;

rip = importdataSE([dir 'rip.csv'], start_time, end_time);
ecg= importdataSE([dir 'ecg.csv'], start_time, end_time);

left_accelx = importdataSE([dir 'left-wrist-accelx.csv'], start_time, end_time);
left_accely = importdataSE([dir 'left-wrist-accely.csv'], start_time, end_time);
left_accelz = importdataSE([dir 'left-wrist-accelz.csv'], start_time, end_time);

left_gyrox = importdataSE([dir 'left-wrist-gyrox.csv'], start_time, end_time);
left_gyroy = importdataSE([dir 'left-wrist-gyroy.csv'], start_time, end_time);
left_gyroz = importdataSE([dir 'left-wrist-gyroz.csv'], start_time, end_time);

right_accelx = importdataSE([dir 'right-wrist-accelx.csv'], start_time, end_time);
right_accely = importdataSE([dir 'right-wrist-accely.csv'], start_time, end_time);
right_accelz = importdataSE([dir 'right-wrist-accelz.csv'], start_time, end_time);

right_gyrox = importdataSE([dir 'right-wrist-gyrox.csv'], start_time, end_time);
right_gyroy = importdataSE([dir 'right-wrist-gyroy.csv'], start_time, end_time);
right_gyroz = importdataSE([dir 'right-wrist-gyroz.csv'], start_time, end_time);

% right_gyro_mag8000 = importdataSE([dir 'org.md2k.puffmarker.data.gyr.mag_8000.rightwrist.csv']);
% right_gyro_mag800 = importdataSE([dir 'org.md2k.puffmarker.data.gyr.mag_800.rightwrist.csv']);
% right_gyro_mag = importdataSE([dir 'org.md2k.puffmarker.data.gyr.mag.rightwrist.csv']);
% left_gyro_mag8000 = importdataSE([dir 'org.md2k.puffmarker.data.gyr.mag_8000.leftwrist.csv']);
% left_gyro_mag800 = importdataSE([dir 'org.md2k.puffmarker.data.gyr.mag_800.leftwrist.csv']);
% left_gyro_mag = importdataSE([dir 'org.md2k.puffmarker.data.gyr.mag.leftwrist.csv']);

plot_signal(rip(:,1), rip(:,2)/2000, '-'); hold on;
% plot_signal(rip(:,1), rip(:,2)/2000, '-'); hold on;

% plot_signal(left_accelx(:,1), left_accelx(:,2)+3, '-');hold on;
plot_signal(left_accely(:,1), left_accely(:,2)+3, '-');hold on;
plot_signal(left_accely(:,1), 3, '--');hold on;
% plot_signal(left_accelz(:,1), left_accelz(:,2)+3, '-');hold on;
% plot_signal(left_gyrox(:,1), left_gyrox(:,2)/250+6, '-');hold on;
% plot_signal(left_gyroy(:,1), left_gyroy(:,2)/250+6, '-');hold on;
% plot_signal(left_gyroz(:,1), left_gyroz(:,2)/250+6, '-');hold on;

% plot_signal(left_gyro_mag(:,1), left_gyro_mag(:,2)/250+12, '-');hold on;
% plot_signal(left_gyro_mag800(:,1), left_gyro_mag800(:,2)/250+12, '-');hold on;
% plot_signal(left_gyro_mag8000(:,1), left_gyro_mag8000(:,2)/250+12, '-');hold on;

% plot_signal(right_accelx(:,1), right_accelx(:,2)+9, '-');hold on;
plot_signal(right_accely(:,1), right_accely(:,2)+9, '-');hold on;
plot_signal(right_accely(:,1), 9, '--');hold on;
% plot_signal(right_accelz(:,1), right_accelz(:,2)+9, '-');hold on;

% plot_signal(right_gyrox(:,1), right_gyrox(:,2)/250+12, '-');hold on;
% plot_signal(right_gyroy(:,1), right_gyroy(:,2)/250+12, '-');hold on;
% plot_signal(right_gyroz(:,1), right_gyroz(:,2)/250+12, '-');hold on;

% plot_signal(right_gyro_mag(:,1), right_gyro_mag(:,2)/250+12, '-');hold on;
% plot_signal(right_gyro_mag800(:,1), right_gyro_mag800(:,2)/250+12, '-');hold on;
% plot_signal(right_gyro_mag8000(:,1), right_gyro_mag8000(:,2)/250+12, '-');hold on;

plot_signal(puff(:,1), 12, '*');hold on;
plot_signal(sm_epi(:,1), 9, '*');hold on;
