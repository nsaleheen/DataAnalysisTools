function [ output_args ] = Convert_10sec_window_to_activity_st_et_window( Dir, fileName )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%     Dir = 'E:\RESEARCH\DATA\MinnesotaSmoking\p6000\s01\';
    if ~exist([Dir 'org.md2k.activity.windowed.activity.label.chest.minute.csv'], 'file')
        return;
    end
    M = importdata([Dir 'org.md2k.activity.windowed.activity.label.chest.minute.csv']);
    window = 60000;
    MaxGap =10000;
    start_time = M(1,1);  
    end_time = M(1,1) + window;
    label= M(1,2);
    R=[];
    for i=2:length(M(:,1));
        if ((M(i,2)~= label) | (M(i,1)-end_time) > MaxGap)     
            R = [R; [start_time end_time label]];
            start_time = M(i,1);  
            end_time = M(i,1) + window;
            label= M(i,2);
        else
            end_time = M(i,1) + window;
        end

    end
%     file_name=[Dir 'Activity_windows1min_st_et.csv']; 
    file_name=[Dir fileName]; 
    dlmwrite(file_name, R, 'precision', 15);


end

