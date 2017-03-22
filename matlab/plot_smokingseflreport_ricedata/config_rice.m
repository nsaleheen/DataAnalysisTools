function G=config_rice()
%% Configure java Paths
allpath=javaclasspath('-dynamic');
c=size(allpath,2);
for i=1:c
    javarmpath(allpath{i});
end
javaaddpath ('functions/ExtractDatabase');  % code for extracting database
javaaddpath ('functions/ExtractDatabase/sqlitejdbc-v056.jar'); % extract database
javaaddpath ('functions/java'); % all java files are in this folder

%% Configure all paths
addpath(genpath('.')); % include all directory in matlab path.

% G.DIR.ROOT=fileparts(pwd);
% G.DIR.SEP=filesep;
G.DIR = 'C:\Users\nsleheen\DATA\RICE_TESTING\';
G.OUTDIR = 'C:\Users\nsleheen\DATA\RICE_TESTING\plotselfreport';
G.pids = '2009';
G.sessions = {'ss2017-02-27', 'ss2017-02-28', 'ss2017-03-01', 'ss2017-03-02', 'ss2017-03-04', 'ss2017-03-05', 'ss2017-03-06', 'ss2017-03-07', 'ss2017-03-08'};
% G.sessions = {'ss2017-03-01', 'ss2017-03-02', 'ss2017-03-04'};
G.sessions = {'ss01'};


% DATA_NAME
G.DATASET_NAME='memphis_lab';
%G.DATASET_NAME='memphis_field';
%G.DATASET_NAME='minnesota_lab';
