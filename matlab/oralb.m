
conn=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\56_null_ORALB_CONNECTION_null_null_null_null_com.oralb.sdk_null_DATA.csv');
brusshingmode=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\57_null_ORALB_BRUSHING_MODE_null_null_null_null_com.oralb.sdk_null_DATA.csv');
brushState=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\58_null_ORALB_BRUSHING_STATE_null_null_null_null_com.oralb.sdk_null_DATA.csv');
press = importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\59_null_ORALB_PRESSURE_null_null_null_null_com.oralb.sdk_null_DATA.csv');

conn=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\New folder\ORALB_CONNECTION.csv');
brusshingmode=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\New folder\ORALB_BRUSHING_MODE.csv');
brushState=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\New folder\ORALB_BRUSHING_STATE.csv');
press = importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\New folder\ORALB_PRESSURE.csv');

dir = 'C:\Users\nsleheen\DATA\oral-B\01312017';
conn=importdata([dir '\ORALB_CONNECTION.csv']);
brusshingmode=importdata([dir '\ORALB_BRUSHING_MODE.csv']);
brushState=importdata([dir '\ORALB_BRUSHING_STATE.csv']);
press = importdata([dir '\ORALB_PRESSURE.csv']);
accl_r = importdata([dir '\ACCL_RIGHT.csv']);
gyro_r = importdata([dir '\GYRO_RIGHT.csv']);

st = conn(1, 1)-5000;

rectangle('Position',[(1485873788278-st)/1000,0,(1485873936739-1485873788278)/1000,12],'FaceColor',[.9 1 0.1]);
hold on;
rectangle('Position',[(1485873981132-st)/1000,0,(1485874060514-1485873981132)/1000,12],'FaceColor',[.5 1 .7]);
hold on;


plot((conn(:,1)-st)/1000, conn(:,2), '-');
hold on;
plot((press(:,1)-st)/1000, 2+press(:,2), '.-');
hold on;

plot((brushState(:,1)-st)/1000, 3+brushState(:,2), '.-');
hold on;

plot((brusshingmode(:,1)-st)/1000, 3+brusshingmode(:,2), '.-');
hold on;

% plot((accl_r(:,1)-st)/1000, 5+accl_r(:,3), '-');
% hold on;
% plot((accl_r(:,1)-st)/1000, 7+accl_r(:,4), '-');
% hold on;
% plot((accl_r(:,1)-st)/1000, 9+accl_r(:,5), '-');
% hold on;

grid on;

legend('Connection (0/1)', 'Pressure (0/1)', 'Brushing state (Idle/Brushing)', 'Brushing mode');
xlabel('Time (seconds)');
xlim([0, 140])
% plot((1485874136031-st)/1000, 1, '*');;
% plot((1485874148646 -st)/1000, 1, '*');

