% fv=importdata('C:\Users\nsleheen\DATA\6smoker_lab_csv_data\featureFile_new_SI.csv');
% inds = find(fv(:,37)==1);
% fv_true = fv(inds, :);
% plot(fv(:,29), fv(:,25), '*');
% hold on;
% plot(fv_true(:,29), fv_true(:,25), 'or');

dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\MT_R6\s01\';
% st=1480454362513-5*60*1000;
% st=1480524300188+20*60*1000;
st=1480533607056+10*60*1000;


% mt r6
% st=1481137875186-10*60*1000;
st=1481067986205
st=1481134092615+7*60*1000
st=1481134092615 + 49*60*60*1000-3*60*1000
et=st+10*60*1000;

wrist = '.leftwrist';

accl_y = importdata10([dir 'left-wrist-accely.csv'], st, et);
% accl_y=accl_y(find(accl_y(:,2)<2 & accl_y(:,2)>-2));
plot(accl_y(:,1),9+ accl_y(:, 2));
hold on;
plot([accl_y(1,1) accl_y(end,1)],[9 9],'k--')

% rolls= importdata([dir 'org.md2k.puffmarker.data.wrist.roll.rightwrist.csv']);
rollPitchOkay= importdata10([dir 'org.md2k.puffmarker.data.wrist.roll-pitch.okay' wrist '.csv'], st, et);
hold on;
plot(rollPitchOkay(:,1),9+ rollPitchOkay(:, 2), '.');
hold on;

rip = importdata10([dir 'org.md2k.puffmarker.data.rip.csv'], st, et);
plot(rip(:,1),6+ rip(:, 2)/2000);
hold on;
features = importdata10([dir 'org.md2k.puffMarker.fv.csv'], st, et);

plot(features(:,1),6+features(:,6)/2000, 'ob'); hold on;

peak= importdata10([dir 'org.md2k.puffmarker.data.rip.peaks.csv'], st, et);
plot(peak(:,1),6+ peak(:, 2)/2000, '.r');
hold on;
valley= importdata10([dir 'org.md2k.puffmarker.data.rip.valleys.csv'], st, et);
plot(valley(:,1),6+ valley(:, 2)/2000, '.g');
hold on;

gyro_mag = importdata10([dir 'org.md2k.puffmarker.data.gyr.mag' wrist '.csv'], st, et);
gyro_mag_800 = importdata10([dir 'org.md2k.puffmarker.data.gyr.mag_800' wrist '.csv'], st, et);
gyro_mag_8000 = importdata10([dir 'org.md2k.puffmarker.data.gyr.mag_8000' wrist '.csv'], st, et);

x = importdata10([dir 'org.md2k.puffmarker.data.candidate.intersections' wrist '.csv'], st, et);
xall = importdata10([dir 'org.md2k.puffmarker.data.candidate.intersections.nofilter.' wrist '.csv'], st, et);
% xall = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.csv']);
% org.md2k.puffMarker.smoking.episode

fv=importdata10([dir 'org.md2k.puffMarker.fv.minute.csv'], st, et);
epi=importdata10([dir 'org.md2k.puffMarker.smoking.episode.csv'], st, et);

% epi_S_E=importdata([dir 'episode_start_end.csv']);
% for i=1:length(epi_S_E) 
%    plot([epi_S_E(i,1) epi_S_E(i,2)],[-2.5 -2.5]);
%    hold on;
% end


gt=importdata10([dir 'PUFF_LABEL_CLOUD.csv'], st, et);
p_label=importdata10([dir 'org.md2k.puffMarker.pufflabel.csv'], st, et);

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
if length(fv)>0
    plot(fv(:, 1), -2, '*b');
end
if length(gt)>0
    plot(gt(:, 1), -3, 'or');
end
if length(p_label)>0
    plot(p_label(:, 1), -4, '*r');
end
% 
% x = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterRIP.csv']);
%  k=3;
% for i=1:length(x) 
%    plot([x(i,1) x(i,2)],[-k -(k*1.25)]);
%    hold on;
% end
% x = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterACCL.csv']);
% k=k+1;
% for i=1:length(x) 
%    plot([x(i,1) x(i,2)],[-k -k]);
%    hold on;
% end
% x = importdata10([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterDUR.csv']);
% k=k+1;
% for i=1:length(x) 
%    plot([x(i,1) x(i,2)],[-k -k]);
%    hold on;
% end
% x = importdata10([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterROLLPITCH.csv']);
% k=k+1;
% 
% for i=1:length(x) 
%    plot([x(i,1) x(i,2)],[-k -k]);
%    hold on;
% end
% 
% % xlim([gt(2, 1)-300000 gt(3, 1)+300000]);
% clear all;
% % x = importdata([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterGYROHEIGHT.csv']);
% % k=k+1;
% % for i=1:length(x) 
% %    plot([x(i,1) x(i,2)],[-k -k]);
% %    hold on;
% % end

