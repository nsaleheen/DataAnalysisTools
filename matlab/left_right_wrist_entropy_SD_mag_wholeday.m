function [ entropy ] = left_right_wrist_entropy_SD_mag_wholeday( Dir, filename_actvWin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     Dir = 'E:\RESEARCH\DATA\MinnesotaSmoking\p6000\s01\';
    entropy =[0 0];
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
%     Actv = importdata([Dir 'org.md2k.activity.windowed.activity.label.chest.csv']);
    Actv = importdata([Dir filename_actvWin]);

    nl = hist(mgl(:, 2), 50);
    nl = nl+1;
    pl = nl / sum(nl);
    entropy_left = -sum(pl.*log2(pl))
    
    nr = hist(mgr(:, 2), 50);
    nr = nr+1;
    pr = nr / sum(nr);
    entropy_right = -sum(pr.*log2(pr))
    
    entropy = [entropy_left entropy_right];
    
end

function B = getSubList(A, starttime, endtime)
    inds = find(A(:, 1)>=starttime & A(:,1)<=endtime);
    B = A(inds, :);
end