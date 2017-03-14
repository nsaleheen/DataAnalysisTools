clear all;
dir = 'C:\Users\nsleheen\DATA\MinnesotaSmokingData\csvdata_si_all\p6000\s01\';

start_time = -1;
end_time = -1;

% ecg= importdataSE([dir 'ecg.csv'], start_time, end_time);
% 
% left_accelx = importdataSE([dir 'left-wrist-accelx.csv'], start_time, end_time);
% left_accely = importdataSE([dir 'left-wrist-accely.csv'], start_time, end_time);
% left_accelz = importdataSE([dir 'left-wrist-accelz.csv'], start_time, end_time);

% right_accelx = importdataSE([dir 'right-wrist-accelx.csv'], start_time, end_time);
% right_accely = importdataSE([dir 'right-wrist-accely.csv'], start_time, end_time);
% right_accelz = importdataSE([dir 'right-wrist-accelz.csv'], start_time, end_time);

mag_chest_accl= importdataSE([dir 'org.md2k.activity.data.accl.mag.chest.csv'], start_time, end_time);
mag_leftwrist_accl= importdataSE([dir 'org.md2k.activity.data.accl.mag.leftwrist.csv'], start_time, end_time);
mag_rightwrist_accl= importdataSE([dir 'org.md2k.activity.data.accl.mag.rightwrist.csv'], start_time, end_time);

sd_c= importdataSE([dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.csv'], start_time, end_time);
sd_lw= importdataSE([dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.leftwrist.csv'], start_time, end_time);
sd_rw= importdataSE([dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.rightwrist.csv'], start_time, end_time);

actv= importdataSE([dir 'org.md2k.activity.windowed.activity.label.chest.csv'], start_time, end_time);
hr= importdataSE([dir 'org.md2k.cstress.data.ecg.rr.heartrate.csv'], start_time, end_time);

for i=1:length(actv(:, 1))
   if actv(i, 2)==1
       rectangle('Position',[actv(i, 1),2,actv(i, 2)+10000,7],'FaceColor',[.5 1 0.1],'EdgeColor',[.5 1 0.1]);
       hold on;
   end       
end
plot(mag_chest_accl(:,1), mag_chest_accl(:,2)/1000, '-');hold on;
hold on;
plot(sd_c(:,1), 4+sd_c(:,2)/200, '-');hold on;
plot(sd_lw(:,1), 5+sd_lw(:,2), '-');hold on;
plot(sd_rw(:,1), 6+sd_rw(:,2), '-');hold on;
plot(hr(:,1), 7+hr(:,2)/50, '-');hold on;

% plot(left_accely (:,1), 8+left_accely (:,2), '-');hold on;
% plot(left_accely (:,1), 8, '--');hold on;
% plot(right_accely(:,1), 11+right_accely (:,2), '-');hold on;
% plot(right_accely(:,1), 11, '--');hold on;
% 

% plot_signal(left_accely(:,1), left_accely(:,2)+3, '-');hold on;
% plot_signal(left_accely(:,1), 3, '--');hold on;
% plot_signal(left_accelz(:,1), left_accelz(:,2)+3, '-');hold on;
% plot_signal(left_gyrox(:,1), left_gyrox(:,2)/250+6, '-');hold on;
% plot_signal(left_gyroy(:,1), left_gyroy(:,2)/250+6, '-');hold on;
% plot_signal(left_gyroz(:,1), left_gyroz(:,2)/250+6, '-');hold on;

% plot_signal(left_gyro_mag(:,1), left_gyro_mag(:,2)/250+12, '-');hold on;
% plot_signal(left_gyro_mag800(:,1), left_gyro_mag800(:,2)/250+12, '-');hold on;
% plot_signal(left_gyro_mag8000(:,1), left_gyro_mag8000(:,2)/250+12, '-');hold on;

% plot_signal(right_accelx(:,1), right_accelx(:,2)+9, '-');hold on;
% plot_signal(right_accely(:,1), right_accely(:,2)+9, '-');hold on;
% plot_signal(right_accely(:,1), 9, '--');hold on;
% plot_signal(right_accelz(:,1), right_accelz(:,2)+9, '-');hold on;

% plot_signal(puff(:,1), 12, '*');hold on;
% plot_signal(sm_epi(:,1), 9, '*');hold on;
