dir='C:\Users\nsleheen\Documents\motion_sense_test\puffmarker_test_data\azim_01\raw\';
 
DATA.left_accel =importdata([dir 'ACCL_LEFT.csv']);
DATA.left_gyro =importdata([dir 'GYRO_LEFT.csv']);

DATA.right_accel =importdata([dir 'ACCL_RIGHT.csv']);
DATA.right_gyro =importdata([dir 'GYRO_RIGHT.csv']);

DATA.rip =importdata([dir 'RIP.csv']);

puff_label=importdata([dir 'PUFF_LABEL.csv']);

plot_sensordata(DATA.left_accel, 1, 1, 4);
hold on;
plot_sensordata(DATA.left_gyro, 250, 3,  3:5);
hold on;

plot_sensordata(DATA.right_accel, -1, 5, 4);
hold on;
plot_sensordata(DATA.right_gyro, 250, 7, 3:5);
hold on;

plot_sensordata(DATA.rip, 2000, 9, 3);
hold on;

for i=1:length(puff_label)
    line([puff_label(i,1) puff_label(i,1)],[-2 12]);
end

gyro_m8000=importdata('C:\Users\nsleheen\DATA\6smoker_lab_csv_data\p08\s01\org.md2k.puffmarker.data.gyr.mag_8000.leftwrist.csv');
gyro_m800=importdata('C:\Users\nsleheen\DATA\6smoker_lab_csv_data\p08\s01\org.md2k.puffmarker.data.gyr.mag_800.leftwrist.csv');
plot_sensordata(gyro_m8000, 250, 11, 2);
hold on;
plot_sensordata(gyro_m800, 250, 11, 2);
hold on;

context_label=csvread([dir 'context_label.txt']);
for i=1:length(context_label)
    line([context_label(i,1) context_label(i,1)],[-2 15]);
    text(context_label(i,1),15,context_label(i,2),'HorizontalAlignment','right');
end