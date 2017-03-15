function G=config_minnesota(G)
G.DIR = 'C:\Users\nsleheen\DATA\csvdataSI_new\';
G.OUTDIR = 'C:\Users\nsleheen\DATA\csvdataSI_new\plotSmokingLab';

    G.TIME.TIMEZONE=-6;
    G.TIME.DAYLIGHTSAVING=1;
    G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';
    
% G.pids = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012'
%     , 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021'};

G.pids = {'p01', 'p02', 'p03', 'p04', 'p05', 'p06'};


G.sessions = {'s01', 's02', 's03', 's04', 's05', 's06', 's07', 's08'};

