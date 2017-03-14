clear all;
G.DIR = 'C:\Users\nsleheen\DATA\RICE_TESTING\';
G.OUTDIR = 'C:\Users\nsleheen\DATA\RICE_TESTING\plotselfreport';
G.pids = '2006';
G.sessions = {'s2017-02-27', 's2017-02-28'};

INDIR = G.DIR;
OUTDIR = G.OUTDIR;
pid = G.pids;
sessions = G.sessions;

for i=s:length(sessions)
    sid = sessions{s};
    dir = [INDIR pid '\' sid '\'];

    a_y_l = importdata([dir 'left-wrist-accely.csv']);
    a_y_r = importdata([dir 'right-wrist-accely.csv']);
    rip = importdata([dir 'rip.csv']);
    valleys = importdata([dir 'org.md2k.puffmarker.data.rip.valleys.filtered.csv']);
    peaks= importdata([dir 'org.md2k.puffmarker.data.rip.peaks.filtered.csv']);

    pLabel=importdata([dir 'org.md2k.puffMarker.pufflabel.minute.csv']);
    puff = pLabel(find(pLabel(:, 2)==1), 1);
    epi=importdata([dir 'org.md2k.puffMarker.smoking.episode.csv']);

    pLabelNew=importdata([dir 'new\org.md2k.puffMarker.pufflabel.minute.csv']);
    puffNew = pLabelNew(find(pLabelNew(:, 2)==1), 1);
    epiNew=importdata([dir 'new\org.md2k.puffMarker.smoking.episode.csv']);

    figure;
    selfReport=importdata([dir 'SMOKING_SELFREPORT_CLOUD.csv']);
    if length(selfReport)>0
        for j=1:length(selfReport(:, 1)) 
            
            if length(epi)>0
                for i=1:length(epi(:, 1)) 
                   rectangle('Position',[epi(i,1),5.5,300000,1],'FaceColor',[.9 .5 0]);
                   hold on;
                end
            end
            if length(pLabel)>0
                plot(pLabel(:, 1), 6, 'og');
                plot(puff, 6, '*r');    
            end
            if length(epiNew)>0
                for i=1:length(epiNew(:, 1)) 
                   rectangle('Position',[epiNew(i,1),6.5,300000,1],'FaceColor',[.9 .5 0]);
                   hold on;
                end
            end
            if length(pLabelNew)>0
                plot(pLabelNew(:, 1), 7, 'og');
                plot(puffNew, 7, '*r');    
            end

            plot(rip(:,1),-2+rip(:, 2)/2000, 'g');
            plot(valleys(:,1),-2+valleys(:, 2)/2000, 'or');
            plot(peaks(:,1),-2+peaks(:, 2)/2000, '*b');

            plot(a_y_l(:,1),3+a_y_l(:, 2), 'b'); hold on;
            plot(a_y_r(:,1),3+a_y_r(:, 2), 'r');
            plot([a_y_r(1,1) a_y_r(end,1)],[3 3],'k--');
            set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
            set(gca,'FontSize',16,'fontWeight','bold');
            plot([selfReport(j,1) selfReport(j,1)], [0 8], 'k');
            text(selfReport(j,1), 8, 'Self-report');
            
            xlim([selfReport(i,1)-15*60000, selfReport(i,1)+10*60000])

%             saveas(gcf,[OUTDIR '\' pid '_' sid 'selfreport_' j '.fig']);
            saveas(gcf,[OUTDIR '\' pid '_' sid 'selfreport_' j '.png']);
            close(gcf);
            
        end
    end

end

