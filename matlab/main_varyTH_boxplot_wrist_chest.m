
clear all;
clear all;

% PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006'};

PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012', 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021', 'p6023', 'p6025', 'p6026', 'p6027', 'p6029', 'p6030', 'p6032', 'p6034', 'p6036', 'p6037', 'p6038', 'p6500', 'p6501', 'p6502', 'p6503', 'p6505', 'p6506', 'p6507', 'p6508', 'p6510'};
% PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012', 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021'};

SIDS = {'s01', 's02', 's11', 's12', 's13'}

TH_wrist = 0.052;
TH_chest = 25.5;

R=[];
C=[];
Dir = 'C:\Users\nsleheen\DATA\MinnesotaSmokingData\csvdata_si_all\';
M_w = [];
for TH=0:0.005:0.25
% for TH=0:0.5:2    
    R=[];
    TH_wrist = TH;
    for i=1:length(PIDS)
        pid = PIDS{i}
        for j=1:length(SIDS)
            sid = SIDS{j}; 
            FileDir = [Dir pid '\' sid '\'];

                if ~exist([FileDir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.left.right.label.csv'], 'file')
                    continue;
                end

                M = importdata([FileDir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.left.right.label.csv']);
%                 M_all = [M_all; M];
                if length(M) >= 2160
                    wrist = min(M(:, 3), M(:, 4));
                    indx = find(wrist(:, 1) >= TH_wrist);                
                    nActive = length(wrist(indx, :));
                    R = [R; (100*nActive / length(M(:, 1)))];
                    
%                     indx = find(M(:, 2) > TH_chest);                                
%                     nActive = length(M(indx, 2));
%                     C = [C; (100*nActive / length(M(:, 1)))];
                end
        end
    end
    M_w = [M_w R];
end

boxplot(M_w, 'Labels', 0:0.01:0.5)

title('Amount of activity VS threshold (Wrist Accelerometer)');
xlabel('Threshold, TH (SD > TH iff activity)');
ylabel('Percentage of Activity');
set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
set(gca,'FontSize',16,'fontWeight','bold');

M_c = [];
% for TH=0:0.001:2
for TH=0:0.3:50    
    C=[];
    TH_chest = TH;
    for i=1:length(PIDS)
        pid = PIDS{i}
        for j=1:length(SIDS)
            sid = SIDS{j}; 
            FileDir = [Dir pid '\' sid '\'];

                if ~exist([FileDir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.left.right.label.csv'], 'file')
                    continue;
                end

                M = importdata([FileDir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.left.right.label.csv']);
%                 M_all = [M_all; M];
                if length(M) >= 2160
               
                    indx = find(M(:, 2) >= TH_chest);                                
                    nActive = length(M(indx, 2));
                    C = [C; (100*nActive / length(M(:, 1)))];
                end
        end
    end
    M_c = [M_c C];
end
figure
boxplot(M_c, 'Labels', 0:0.3:50)

title('Amount of activity VS threshold (Chest Accelerometer)');
xlabel('Threshold, TH (SD > TH iff activity)');
ylabel('Percentage of Activity');
set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
set(gca,'FontSize',16,'fontWeight','bold');