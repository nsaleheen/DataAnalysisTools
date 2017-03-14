Dir = 'C:\Users\nsleheen\DATA\MinnesotaSmokingData\csvdata_si_all\dataset_plot\';
M = importdata([Dir 'dataset_chest_lft_rght_actLabel.csv']);

cst  = M(:, 1);
lw  = M(:, 2);
rw  = M(:, 3);
A  = M(:, 4);
wrist = min(lw, rw);


TPRR=[];
FPRR=[];
THH=[];
id=fopen([Dir 'threshold_wrist.csv'],'w');
fprintf(id,'TH,TP,FN,FP,TN,ACC,TPR,FPR,PRC\n');
for TH=0:0.001:2

    vv = wrist;
    TN=length(find(A==0 & vv<TH));
    FP=length(find(A==0 & vv>=TH));
    
    TP=length(find(A==1 & vv>=TH));    
    FN=length(find(A==1 & vv<TH));

    ACC=(TP+TN)/(TP+TN+FP+FN);
    TPR=TP/(TP+FN);
    FPR=FP/(FP+TN);
    PRC=TP/(TP+FP);
    fprintf(id,'%f,%f,%f,%f,%f,%f,%f,%f,%f\n',TH,TP,FN,FP,TN,ACC,TPR,FPR,PRC);
%    fprintf('%f,%f,%f,%f,%f,%f,%f,%f,%f\n',TH,TP,FN,FP,TN,ACC,TPR,FPR,PRC);

    TPRR(end+1)=TPR;
    FPRR(end+1)=FPR;
    THH(end+1)=TH;
end
fclose(id);


plot(FPRR,TPRR,'r--','linewidth',2);
% legend('Single Threshold on Non-dominan based');

xlabel('False Positive');
ylabel('True Positive Rate');
set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
set(gca,'FontSize',16,'fontWeight','bold');
grid on;


    