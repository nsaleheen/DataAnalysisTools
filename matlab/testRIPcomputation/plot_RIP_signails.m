G.DIR = 'C:\Users\nsleheen\DATA\csvdataSI_new\';
G.OUTDIR = 'C:\Users\nsleheen\DATA\csvdataSI_new\plotSmokingLab';

G.TIME.TIMEZONE=-6;
G.TIME.DAYLIGHTSAVING=1;
G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';
    
% G.pids = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012'
%     , 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021'};

G.pids = {'p01'};
figure;

G.sessions = {'s02'};

    INDIR = G.DIR;
    OUTDIR = G.OUTDIR;
    pids = G.pids;
    sessions = G.sessions;

    for p=1:length(pids)
        pid = pids{p};
        for s=1:length(sessions)
            sid = sessions{s};
            dir = [INDIR pid '\' sid '\']

            rip = importdataMatTime([dir 'rip.csv']);
            ripsmooth = importdataMatTime([dir 'org.md2k.cstress.data.rip.smooth.csv']);
            ripmac = importdataMatTime([dir 'org.md2k.cstress.data.rip.mac.csv']);
            if length(rip) ==0 
                continue; 
            end;
            valleys = importdataMatTime([dir 'org.md2k.puffmarker.data.rip.valleys.filtered.csv']);
            peaks= importdataMatTime([dir 'org.md2k.puffmarker.data.rip.peaks.filtered.csv']);
            peakCandidate = importdataMatTime([dir 'org.md2k.puffmarker.data.candidate.rip.peak.csv']);
            valleysCandidate = importdataMatTime([dir 'org.md2k.puffmarker.data.candidate.rip.valley.csv']);



            valleysOld = importdataMatTime([dir 'org.md2k.cstress.data.rip.valleys.filtered.csv']);
            peaksOld= importdataMatTime([dir 'org.md2k.cstress.data.rip.peaks.filtered.csv']);
            truePuffLabel=importdataMatTime([dir 'puffGroundtruth.csv']);

            plot(rip(:,1),-1+rip(:, 2)/1000, '.b'); hold on;
            plot(ripsmooth(:,1),-1+ripsmooth(:, 2)/1000, '.c'); hold on;
            plot(ripmac(:,1),-1+ripmac(:, 2)/1000, 'y'); hold on;
            plot(valleys(:,1),-1+valleys(:, 2)/1000, 'or');
            plot(peaks(:,1),-1+peaks(:, 2)/1000, '*b');
            plot(valleysCandidate(:,1),-1+valleysCandidate(:, 2)/1000, 'dr', 'MarkerSize',7);
            plot(peakCandidate(:,1),-1+peakCandidate(:, 2)/1000, 'dk', 'MarkerSize',7);

            plot(rip(:,1),3+rip(:, 2)/1000, '.b'); hold on;
            plot(ripsmooth(:,1),3+ripsmooth(:, 2)/1000, '.c'); hold on;
            plot(ripmac(:,1),3+ripmac(:, 2)/1000, 'y'); hold on;
            plot(valleysOld(:,1),3+valleysOld(:, 2)/1000, 'or');
            plot(peaksOld(:,1),3+peaksOld(:, 2)/1000, '*b');

            
                    
            if length(truePuffLabel)>0
                for k=1:length(truePuffLabel) 
                   plot([truePuffLabel(k) truePuffLabel(k)], [-2 10], 'k');
                   text(truePuffLabel(k,1), 10, 'Puff');
                end
            end 
            dynamicDateTicks;
            dynamicDateTicks;

            title([pid ' _ ' sid ' RIP data ']);

            set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
            set(gca,'FontSize',16,'fontWeight','bold');

%                     saveas(gcf,[OUTDIR '\' pid '_' sid '_Epi_' num2str(i) '.fig']);
% 
%                     saveas(gcf,[OUTDIR '\' pid '_' sid '_Epi_' num2str(i) '.png']);
%                     close(gcf);
        end
    end






