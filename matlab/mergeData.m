dir='C:\Users\nsleheen\DATA\data_collected_for_activity\sakther\01292017\raw\';
% subDir = 'GYRO_RIGHT';
% sensor = 24;
% filedir = [dir subDir];
% 
% subDir = 'GYRO_LEFT';
% sensor = 13;
% filedir = [dir subDir];
% 
% subDir = 'ACCL_RIGHT';
% sensor = 21;
% filedir = [dir subDir];
% 
% subDir = 'ACCL_LEFT';
% sensor = 9;
% filedir = [dir subDir];

% mergeAndSave(dir, 'RIP', 12, 13, 18, '\20170129', '');
mergeAndSave(dir, 'ECG', 7, 13, 18, '\20170129', '');
mergeAndSave(dir, 'ACCL_LEFT', 17, 13, 18, '\20170129', '');
mergeAndSave(dir, 'ACCL_RIGHT', 21, 13, 18, '\20170129', '');
mergeAndSave(dir, 'GYRO_LEFT', 18, 13, 18, '\20170129', '');
mergeAndSave(dir, 'GYRO_RIGHT', 22, 13, 18, '\20170129', '');
mergeAndSave(dir, 'ACCL_X', 8, 13, 18, '\20170129', '');
mergeAndSave(dir, 'ACCL_Y', 9, 13, 18, '\20170129', '');
mergeAndSave(dir, 'ACCL_Z', 10, 13, 18, '\20170129', '');
% 
% subDir = 'RIP';
% sensor = 12;
% filedir = [dir subDir];
% 
% sIndex = 13;
% eIndex = 18;
% 
% 
% M=importdata([filedir '\20170129' int2str(sIndex) '_' int2str(sensor) '_archive.csv']);
% for indx=(sIndex+1):1:eIndex
%     [filedir '\20170129' int2str(indx) '_' int2str(sensor)  '_archive.csv']
%     M=[M; importdata([filedir '\20170129' int2str(indx) '_' int2str(sensor)  '_archive.csv'])];
% end
% 
% dlmwrite([dir subDir '.csv'], M, 'precision', 15);