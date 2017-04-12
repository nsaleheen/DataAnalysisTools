function G=config_minnesota_activity(G)
dir='C:\Users\nsleheen\DATA\DataProcessingFramework\data\activity\sensor_data_adc\';
% dir='C:\Users\nsleheen\DATA\MinnesotaSmokingData\csvdata_si_all\';

G.DIR = dir;
G.OUTDIR = [dir 'plot_activity_new'];

% G.pids = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012'
%     , 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021'};

G.pids = {'p01', 'p02', 'p03', 'p04', 'p05'};
G.sessions = {'s01', 's02', 's03', 's04', 's05', 's06', 's07', 's08', 's09', 's10'};


% G.pids = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006'};


% G.sessions = {'s01', 's02', 's11', 's12', 's13', 's14'};
