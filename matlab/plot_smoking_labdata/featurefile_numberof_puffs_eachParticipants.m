
N=importdata('C:\Users\nsleheen\Documents\featureFile_puffmarker_032017_timestamp.csv');
% N=N.data;
fprintf('TOTAL=%d, PUFFS=%d\n', length(N(:, 1)), length(find(N(:, end)==1)));
nT=0;
nP=0;
for i=1:6
    Di = N(find(N(:, 1)==i), :);
    Diu = Di( find(unique(Di(:, 2))) , :);
    fprintf('pid: p%d ... total=%d, puffs=%d\n', i, length(Diu(:, 1)), length(find(Diu(:, end)==1)));
    nP = nP + length(find(Diu(:, end)==1));
    nT = nT+ length(Diu(:, 1));
end

fprintf('Uniq TOTAL=%d, Uniq  PUFFS=%d\n', nT, nP);