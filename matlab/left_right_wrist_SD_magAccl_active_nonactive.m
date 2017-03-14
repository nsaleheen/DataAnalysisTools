function [ Res] = left_right_wrist_SD_magAccl_active_nonactive( Dir, filename_actvWin )
    Res = [];
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

    leftListA = [];
    rightListA= [];
    leftListS = [];
    rightListS= [];
    if length(Actv) > 0
        for i=1:length(Actv(:,1));
            start_time = Actv(i,1);  
            end_time = Actv(i,2);% + window;    
            leftSublist = getSubList(mgl, start_time, end_time);
            rightSublist = getSubList(mgr, start_time, end_time);
            if length(leftSublist)>0 & length(rightSublist)>0

                if ((Actv(i,3)== 0))                
                    leftListS= [leftListS; leftSublist(:, 2)];
                    rightListS = [rightListS; rightSublist(:, 2)];
                else
                    leftListA= [leftListA; leftSublist(:, 2)];
                    rightListA = [rightListA; rightSublist(:, 2)];
                end
            end
        end
    end
    Res = [std(leftListA) std(rightListA) std(leftListS) std(rightListS) std(mgl(:, 2)) std(mgr(:, 2)) ];
end

function B = getSubList(A, starttime, endtime)
    inds = find(A(:, 1)>=starttime & A(:,1)<=endtime);
    B = A(inds, :);
end