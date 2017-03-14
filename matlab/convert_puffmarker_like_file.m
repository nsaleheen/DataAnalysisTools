dir='C:\Users\nsleheen\DATA\data_collected_for_activity\sakther\01292017\raw\';

subDir = 'ACCL_LEFT';
filename= [dir subDir '.csv'];
M=importdata(filename);
ii=3;
M_x = [M(:,1) M(:,ii)];
M_y = [M(:,1) M(:,ii+1)];
M_z = [M(:,1) M(:,ii+2)];
dlmwrite([dir 'left-wrist-accelx.csv'], M_x, 'precision', 15);
dlmwrite([dir 'left-wrist-accely.csv'], M_y, 'precision', 15);
dlmwrite([dir 'left-wrist-accelz.csv'], M_z, 'precision', 15);

subDir = 'GYRO_LEFT';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
M_y = [M(:,1) M(:,ii+1)];
M_z = [M(:,1) M(:,ii+2)];
dlmwrite([dir 'left-wrist-gyrox.csv'], M_x, 'precision', 15);
dlmwrite([dir 'left-wrist-gyroy.csv'], M_y, 'precision', 15);
dlmwrite([dir 'left-wrist-gyroz.csv'], M_z, 'precision', 15);


subDir = 'ACCL_RIGHT';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
M_y = [M(:,1) -M(:,ii+1)];
M_z = [M(:,1) M(:,ii+2)];
dlmwrite([dir 'right-wrist-accelx.csv'], M_x, 'precision', 15);
dlmwrite([dir 'right-wrist-accely.csv'], M_y, 'precision', 15);
dlmwrite([dir 'right-wrist-accelz.csv'], M_z, 'precision', 15);

subDir = 'GYRO_RIGHT';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
M_y = [M(:,1) -M(:,ii+1)];
M_z = [M(:,1) M(:,ii+2)];
dlmwrite([dir 'right-wrist-gyrox.csv'], M_x, 'precision', 15);
dlmwrite([dir 'right-wrist-gyroy.csv'], M_y, 'precision', 15);
dlmwrite([dir 'right-wrist-gyroz.csv'], M_z, 'precision', 15);

subDir = 'RIP_MOBILE';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
dlmwrite([dir 'rip.csv'], M_x, 'precision', 15);

subDir = 'ECG_MOBILE';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
dlmwrite([dir 'ecg.csv'], M_x, 'precision', 15);

subDir = 'ACCL_X';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
dlmwrite([dir 'accelx.csv'], M_x, 'precision', 15);

subDir = 'ACCL_Y';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
dlmwrite([dir 'accely.csv'], M_x, 'precision', 15);

subDir = 'ACCL_Z';
filename= [dir subDir '.csv'];
M=importdata(filename);
M_x = [M(:,1) M(:,ii)];
dlmwrite([dir 'accelz.csv'], M_x, 'precision', 15);
