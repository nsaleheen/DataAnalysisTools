function [ output_args ] = left_right_wrist_mean_acclY_during_activity( Dir, filename_actvWin, plot_filename )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     Dir = 'E:\RESEARCH\DATA\MinnesotaSmoking\p6000\s01\';
    if ~exist([Dir 'left-wrist-accely.csv'], 'file')
        return;
    end
    if ~exist([Dir 'right-wrist-accely.csv'], 'file')
        return;
    end
    if ~exist([Dir filename_actvWin], 'file')
        return;
    end
    Ayl = importdata([Dir 'left-wrist-accely.csv']);
    Ayr = importdata([Dir 'right-wrist-accely.csv']);
%     Actv = importdata([Dir 'org.md2k.activity.windowed.activity.label.chest.csv']);
    Actv = importdata([Dir filename_actvWin]);
    
    window = 10000;

    R=[];
    
    for i=1:length(Actv(:,1));
        if ((Actv(i,3)== 1))                
            start_time = Actv(i,1);  
            end_time = Actv(i,2);% + window;    
            if (end_time - start_time) < 120000
                continue;
            end
            la = getSubList(Ayl, start_time, end_time);
            ra = getSubList(Ayr, start_time, end_time);
            if length(la)>0 & length(ra)>0
                R = [R; [la(1,1) mean(la(:,2)) mean(ra(:, 2))]];
            end
        end
    end
%     file_name=[Dir 'mean_acclY_leaft_right_wrist_windows.csv']; 
%     dlmwrite(file_name, R, 'precision', 15);
%     plot(R(:, 1), R(:, 2), '*r'); hold on;
%     plot(R(:, 1), R(:, 3), 'ob');
    plot(R(:, 2), '*r'); hold on;
    plot(R(:, 3), 'ob');
    plot([0 length(R(:, 1))],[0 0], '--');
%     plot([0, length()], 'ob');
    
    legend('Mean of Accel Y (Left wrist)', 'Mean of Accel Y (Right wrist)');
    ylabel('Accelerometer Y (g)','FontSize',10,'FontWeight','bold','Color','b');
    saveas(gcf,plot_filename,'jpg');
    close(gcf);
end

function B = getSubList(A, starttime, endtime)
    inds = find(A(:, 1)>=starttime & A(:,1)<=endtime);
    B = A(inds, :);
end