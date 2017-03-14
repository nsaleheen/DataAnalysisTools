% fv=importdata('C:\Users\nsleheen\DATA\6smoker_lab_csv_data\featureFile_new_SI.csv');
% inds = find(fv(:,37)==1);
% fv_true = fv(inds, :);
% plot(fv(:,29), fv(:,25), '*');
% hold on;
% plot(fv_true(:,29), fv_true(:,25), 'or');

dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p09\s01\';
% gyro_mag = importdata([dir 'org.md2k.puffmarker.data.gyr.mag.leftwrist.csv']);
% gyro_mag_800 = importdata([dir 'org.md2k.puffmarker.data.gyr.mag_800.leftwrist.csv']);
% gyro_mag_8000 = importdata([dir 'org.md2k.puffmarker.data.gyr.mag_8000.leftwrist.csv']);
% 
% x = importdata([dir 'org.md2k.puffmarker.data.candidate.intersections.leftwrist.csv']);
% xall = importdata([dir 'org.md2k.puffmarker.data.candidate.intersections.nofilter..leftwrist.csv']);

% accl_yl = importdata([dir 'org.md2k.puffMarker.data.accel.y.leftwrist.csv']);
% % accl_y=accl_y(find(accl_y(:,2)<2 & accl_y(:,2)>-2));
% plot(accl_yl(:,1),4+ accl_yl(:, 2));
% hold on;
accl_y = importdata([dir 'right-wrist-accely.csv']);
% accl_y=accl_y(find(accl_y(:,2)<2 & accl_y(:,2)>-2));
plot(accl_y(:,1),9+ accl_y(:, 2));
hold on;
plot([accl_y(1,1) accl_y(end,1)],[9 9],'k--')

% rolls= importdata([dir 'org.md2k.puffmarker.data.wrist.roll.rightwrist.csv']);
% rollPitchOkay= importdata([dir 'org.md2k.puffmarker.data.wrist.roll-pitch.okay.rightwrist.csv']);
% hold on;
% plot(rollPitchOkay(:,1),9+ rollPitchOkay(:, 2), '.');
% hold on;

rip = importdata([dir 'rip.csv']);
plot(rip(:,1),6+ rip(:, 2)/2000);
hold on;
features = importdata([dir 'org.md2k.puffMarker.fv.csv']);

plot(features(:,1),6+features(:,6)/2000, 'ob'); hold on;

peak= importdata([dir 'org.md2k.puffmarker.data.rip.peaks.csv']);
plot(peak(:,1),6+ peak(:, 2)/2000, '.r');
hold on;
valley= importdata([dir 'org.md2k.puffmarker.data.rip.valleys.csv']);
plot(valley(:,1),6+ valley(:, 2)/2000, '.g');
hold on;


gyro_mag = importdata([dir 'org.md2k.puffmarker.data.gyr.mag.rightwrist.csv']);
gyro_mag_800 = importdata([dir 'org.md2k.puffmarker.data.gyr.mag_800.rightwrist.csv']);
gyro_mag_8000 = importdata([dir 'org.md2k.puffmarker.data.gyr.mag_8000.rightwrist.csv']);

x = importdata([dir 'org.md2k.puffmarker.data.candidate.intersections.rightwrist.csv']);
xall = importdata([dir 'org.md2k.puffmarker.data.candidate.intersections.nofilter..rightwrist.csv']);
% xall = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.csv']);
% org.md2k.puffMarker.smoking.episode

fv=importdata([dir 'org.md2k.puffMarker.fv.minute.csv']);
epi=importdata([dir 'org.md2k.puffMarker.smoking.episode.csv']);

% epi_S_E=importdata([dir 'episode_start_end.csv']);
% for i=1:length(epi_S_E) 
%    plot([epi_S_E(i,1) epi_S_E(i,2)],[-2.5 -2.5]);
%    hold on;
% end


gt=importdata([dir 'puffGroundtruth.csv']);
p_label=importdata([dir 'org.md2k.puffMarker.pufflabel.csv']);

plot(gyro_mag(:,1), gyro_mag(:, 2)/100, 'b');
hold on;
plot(gyro_mag_800(:,1), gyro_mag_800(:, 2)/100, '.');
hold on;
plot(gyro_mag_8000(:,1), gyro_mag_8000(:, 2)/100, '.');

% for i=1:length(xall) 
%    plot([xall(i,1) xall(i,2)],[-1 -2]);
%    hold on;
% end

for i=1:length(x) 
   plot([x(i,1) x(i,2)],[-2 -1]);
   hold on;
end
% 
% plot(fv(:, 1), fv(:, 26), '*r');
% plot(fv(:, 1), fv(:, 30), 'ob');

plot(fv(:, 1), -2, '*b');
plot(gt(:, 1), -3, 'or');
plot(p_label(:, 1), -4, '*r');

x = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterRIP.csv']);
 k=3;
for i=1:length(x) 
   plot([x(i,1) x(i,2)],[-k -(k*1.25)]);
   hold on;
end
x = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterACCL.csv']);
k=k+1;
for i=1:length(x) 
   plot([x(i,1) x(i,2)],[-k -k]);
   hold on;
end
x = importdata10([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterDUR.csv']);
k=k+1;
for i=1:length(x) 
   plot([x(i,1) x(i,2)],[-k -k]);
   hold on;
end
x = importdata10([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterROLLPITCH.csv']);
k=k+1;

for i=1:length(x) 
   plot([x(i,1) x(i,2)],[-k -k]);
   hold on;
end

% xlim([gt(2, 1)-300000 gt(3, 1)+300000]);
clear all;
% x = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterGYROHEIGHT.csv']);
% k=k+1;
% for i=1:length(x) 
%    plot([x(i,1) x(i,2)],[-k -k]);
%    hold on;
% end

