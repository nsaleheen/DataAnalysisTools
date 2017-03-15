function G=config()
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

G.STUDY = 'minnesotaSmoking';