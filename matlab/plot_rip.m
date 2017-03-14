dir='C:\Users\nsleheen\DATA\6smoker_lab_csv_data\p08\s02\';

subDir = 'rip'; 
% subDir='org.md2k.cstress.data.rip';
filename= [dir subDir '.csv'];
a = importdata(filename);
plot(a(:,1), a(:,2)/2000, 'g');
hold on;

subDir = 'rip_valleys';
% subDir = '';
filename= [dir subDir '.csv'];
a = importdata(filename);
plot(a(:,1), a(:,2)/2000, 'or');
hold on;

subDir = 'rip_peaks';
% subDir = '';
filename= [dir subDir '.csv'];
a = importdata(filename);
plot(a(:,1), a(:,2)/2000, '*b');
hold on;
% 
% subDir = 'rip_raw';
% % subDir = '';
% filename= [dir subDir '.csv'];
% a = importdata(filename);
% plot(a(:,1), a(:,2)/2000);
% hold on;
% 
% subDir = 'rip_raw_valleys';
% % subDir = '';
% filename= [dir subDir '.csv'];
% a = importdata(filename);
% plot(a(:,1), a(:,2)/2000, '*b');
% hold on;
% 
% subDir = 'rip_raw_peaks';
% % subDir = '';
% filename= [dir subDir '.csv'];
% a = importdata(filename);
% plot(a(:,1), a(:,2)/2000, 'or');
% hold on;