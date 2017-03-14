allpath=javaclasspath('-dynamic');
c=size(allpath,2);
for i=1:c
    javarmpath(allpath{i});
end
javaaddpath ('functions/ExtractDatabase');  % code for extracting database
javaaddpath ('functions/ExtractDatabase/sqlitejdbc-v056.jar'); % extract database
javaaddpath ('functions/java'); 
addpath(genpath('.')); % include all directory in matlab path.

    G.TIME.TIMEZONE=-6;
    G.TIME.DAYLIGHTSAVING=1;
    G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';
% x(:,2)=convert_timestamp_matlabtimestamp(G, x(:,2));
dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p01\s03\';

wrist = '.rightwrist';

rip = importdata([dir 'org.md2k.puffmarker.data.rip.csv']);
accl_y = importdata([dir 'right-wrist-accely.csv']);
y800 = importdata([dir 'org.md2k.puffmarker.data.accl.y.mag_800' wrist '.csv']);
y8000 = importdata([dir 'org.md2k.puffmarker.data.accl.y.mag_8000' wrist '.csv']);
peak= importdata([dir 'org.md2k.puffmarker.data.rip.peaks.csv']);
valley= importdata([dir 'org.md2k.puffmarker.data.rip.valleys.csv']);

gyro_mag = importdata([dir 'org.md2k.puffmarker.data.gyr.mag' wrist '.csv']);
gyro_mag_800 = importdata([dir 'org.md2k.puffmarker.data.gyr.mag_800' wrist '.csv']);
gyro_mag_8000 = importdata([dir 'org.md2k.puffmarker.data.gyr.mag_8000' wrist '.csv']);

roll= importdata([dir 'org.md2k.puffmarker.data.wrist.roll' wrist '.csv']);
pitch= importdata([dir 'org.md2k.puffmarker.data.wrist.pitch' wrist '.csv']);

gt=importdata([dir 'puffGroundtruth.csv']);

M = roll;
plot_signal(M(:,1), M(:, 2), '.')
hold on;
M = pitch;
plot_signal(M(:,1), M(:, 2), '.g')

hold on;
M = accl_y;
plot_signal(M(:,1), 20*M(:, 2), '--')

plot_signal(gt(:,1), -20, 'or')

% if length(gt)>0
%     plot(gt(:, 1), -3, 'or');
% end