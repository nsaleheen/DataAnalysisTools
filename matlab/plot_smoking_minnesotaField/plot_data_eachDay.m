function G=plot_data_eachDay(G)
    G = config_minnesota(G);

    INDIR = G.DIR;
    OUTDIR = G.OUTDIR;
    pids = G.pids;
    sessions = G.sessions;

    for p=1:length(pids)
    pid = pids{p};
        for s=1:length(sessions)
            sid = sessions{s};
            dir = [INDIR pid '\' sid '\']

            a_y_l = importdataMatTime([dir 'left-wrist-accely.csv']);
            a_y_r = importdataMatTime([dir 'right-wrist-accely.csv']);
            rip = importdataMatTime([dir 'rip.csv']);
            if length(rip) ==0 
                continue; 
            end;
            valleys = importdataMatTime([dir 'org.md2k.puffmarker.data.rip.valleys.filtered.csv']);
            if length(valleys) ==0 
                continue; 
            end;
            peaks= importdataMatTime([dir 'org.md2k.puffmarker.data.rip.peaks.filtered.csv']);

            pLabel=importdataMatTime([dir 'org.md2k.puffMarker.pufflabel.minute.csv']);
            puff = pLabel(find(pLabel(:, 2)==1), 1);
            epi=importdataMatTime([dir 'org.md2k.puffMarker.smoking.episode.csv']);

            if length(epi)>0
                for i=1:length(epi(:, 1)) 
                   rectangle('Position',[epi(i,1),5.5,5/(24*60),1],'FaceColor',[.9 .5 0]);
                   hold on;
                end
            end
            if length(pLabel)>0
                plot(pLabel(:, 1), 6, 'og');
                plot(puff, 6, '*r');    
            end

            plot(rip(:,1),-2+rip(:, 2)/1000, 'g');
            plot(valleys(:,1),-2+valleys(:, 2)/1000, 'or');
            plot(peaks(:,1),-2+peaks(:, 2)/1000, '*b');

            plot(a_y_l(:,1),3+a_y_l(:, 2), 'b'); hold on;
            plot(a_y_r(:,1),3+a_y_r(:, 2), 'r');
            plot([a_y_r(1,1) a_y_r(end,1)],[3 3],'k--');

            title([pid ' _ ' sid ]);

            set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
            set(gca,'FontSize',16,'fontWeight','bold');
            dynamicDateTicks;

            saveas(gcf,[OUTDIR '\' pid '_' sid '.fig']);
            saveas(gcf,[OUTDIR '\' pid '_' sid '.png']);
            close(gcf);
        end
    end
end
