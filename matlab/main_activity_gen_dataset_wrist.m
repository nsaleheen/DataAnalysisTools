clear all;
PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006'};

% PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012', 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021'};
PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012', 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021', 'p6023', 'p6025', 'p6026', 'p6027', 'p6029', 'p6030', 'p6032', 'p6034', 'p6036', 'p6037', 'p6038', 'p6500', 'p6501', 'p6502', 'p6503', 'p6505', 'p6506', 'p6507', 'p6508', 'p6510'};

SIDS = {'s01', 's02', 's11', 's12', 's13'}
pid = 'p6000';
sid = 's02';

R=[];
Dir = 'C:\Users\nsleheen\DATA\MinnesotaSmokingData\csvdata_si_all\';
for i=1:length(PIDS)
    pid = PIDS{i};
    for j=1:length(SIDS)
        sid = SIDS{j}; 
        FileDir = [Dir pid '\' sid '\'];
        
            if ~exist([FileDir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.left.right.label.csv'], 'file')
                continue;
            end

            M = importdata([FileDir 'org.md2k.activity.data.accel.windowed.magnitude.stdev.chest.left.right.label.csv']);
            if length(M) > 0
                R = [R; M(:, 2:end)];
            end
    end
end
file_name=[Dir  'dataset_plot\dataset_chest_lft_rght_actLabel.csv']; 
dlmwrite(file_name, R, 'precision', 15);

A_R = R(find(R(:,4)==1), :);
S_R = R(find(R(:,4)==0), :);

A = min(A_R(:,2), A_R(:,3));
S = min(S_R(:,2), S_R(:,3));
% plot(A, '.r');hold on;
% plot(S, '.b');

histfit(S);
hold on;
histfit(A);
ylim([0, 900]);
% plot(A_R(:, 2), '.r');hold on;
% plot(A_R(:, 3), '+r');
% plot(S_R(:, 2), '.b');
% plot(S_R(:, 3), '+b');

% xlim([0, length(A)]);


