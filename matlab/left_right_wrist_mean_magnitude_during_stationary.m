function [ output_args ] = left_right_wrist_mean_magnitude_during_stationary( Dir, filename_actvWin, plot_filename )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     Dir = 'E:\RESEARCH\DATA\MinnesotaSmoking\p6000\s01\';
%     if ~exist([Dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.leftwrist.csv'], 'file')
%         return;
%     end
%     if ~exist([Dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.rightwrist.csv'], 'file')
%         return;
%     end
%     if ~exist([Dir filename_actvWin], 'file')
%         return;
%     end
% %     org.md2k.activity.data.accel.windowed.magnitude.stdev.leftwrist
%     mgl = importdata([Dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.leftwrist.csv']);
%     mgr = importdata([Dir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.rightwrist.csv']);
% %     Actv = importdata([Dir 'org.md2k.activity.windowed.activity.label.chest.csv']);
    if ~exist([Dir 'org.md2k.activity.data.accl.mag.leftwrist.csv'], 'file')
        return;
    end
    if ~exist([Dir 'org.md2k.activity.data.accl.mag.rightwrist.csv'], 'file')
        return;
    end
    if ~exist([Dir filename_actvWin], 'file')
        return;
    end
    
    mgl = importdata([Dir 'org.md2k.activity.data.accl.mag.leftwrist.csv']);
    mgr = importdata([Dir 'org.md2k.activity.data.accl.mag.rightwrist.csv']);
    Actv = importdata([Dir filename_actvWin]);

    R=[];
    leftList = [];
    rightList= [];
    for i=1:length(Actv(:,1));
        if ((Actv(i,3)== 0))                
            start_time = Actv(i,1);  
            end_time = Actv(i,2);% + window;    
            if (end_time - start_time) < 120000
                continue;
            end
            leftSublist = getSubList(mgl, start_time, end_time);
            rightSublist = getSubList(mgr, start_time, end_time);
            if length(leftSublist)>0 & length(rightSublist)>0
                leftList = [leftList; leftSublist(:, 2)];
                rightList = [rightList; rightSublist(:, 2)];
                R = [R; [leftSublist(1,1) std(leftSublist(:,2)) std(rightSublist(:, 2))]];
            end
        end
    end
%     file_name=[Dir 'mean_acclY_leaft_right_wrist_windows.csv']; 
%     dlmwrite(file_name, R, 'precision', 15);
%     plot(R(:, 1), R(:, 2), '*r'); hold on;
%     plot(R(:, 1), R(:, 3), 'ob');
    plot(R(:, 2), '*r'); hold on;
    plot(R(:, 3), 'ob');

    plot([0 length(R(:, 1))],[std(leftList) std(leftList)], '-r');
    plot([0 length(R(:, 1))],[std(rightList) std(rightList)], '-b');

    plot([0 length(R(:, 1))],[std(mgl(:, 2)) std(mgl(:, 2))], '--r');
    plot([0 length(R(:, 1))],[std(mgr(:, 2)) std(mgr(:, 2))], '--b');
%     ylim([0.5, 1.3])
%     plot([0, length()], 'ob');
%     legend('Mean of Accelerometer Magnitude-Each Stationary Window (Left wrist)', 'Mean of Accelerometer Magnitude-window (Right wrist)','Mean of Accelerometer Magnitude-Statonary (Left wrist)', 'Mean of Accelerometer Magnitude-Statonary (Right wrist)' , 'Mean of Accelerometer Magnitude-All day (Left wrist)', 'Mean of Accelerometer Magnitude-All day (Right wrist)');
    legend('SD: Each stationary window >2min (Left wrist)', 'SD: Each stationary window >2min (Right wrist)','SD: All statonary windows (Left wrist)', 'SD: All statonary windows (Right wrist)' , 'SD: All day (Left wrist)', 'SD: All day (Right wrist)');
%     legend('Location','southeast');
%     ylabel('Accelerometer Magnitude (g)','FontSize',10,'FontWeight','bold','Color','b');
    saveas(gcf,plot_filename,'jpg');
    close(gcf);
end

function B = getSubList(A, starttime, endtime)
    inds = find(A(:, 1)>=starttime & A(:,1)<=endtime);
    B = A(inds, :);
end