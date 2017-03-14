
conn=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\56_null_ORALB_CONNECTION_null_null_null_null_com.oralb.sdk_null_DATA.csv');
brusshingmode=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\57_null_ORALB_BRUSHING_MODE_null_null_null_null_com.oralb.sdk_null_DATA.csv');
brushState=importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\58_null_ORALB_BRUSHING_STATE_null_null_null_null_com.oralb.sdk_null_DATA.csv');
press = importdata('C:\Users\nsleheen\Documents\motion_sense_test\oralB-test\59_null_ORALB_PRESSURE_null_null_null_null_com.oralb.sdk_null_DATA.csv');
 
 
plot(conn(:,1), conn(:,2), '*');
hold on;
plot(brusshingmode(:,1), 2+ brusshingmode(:,2), '*');
hold on;
plot(brushState(:,1), 4+brushState(:,2), '*');
hold on;
plot(press(:,1), 8+press(:,2), '*');
hold on;

