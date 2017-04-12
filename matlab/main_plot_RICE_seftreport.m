clear all;
G = config();

G = config_rice(G);

INDIR = G.DIR;
OUTDIR = G.OUTDIR;
pids = G.pids;
sessions = G.sessions;

for p=1:length(pids)
pid = pids{p};
    for s=1:length(sessions)
        sid = sessions{s};
        dir = [INDIR pid '\' sid '\'];
        if exist(dir, 'dir') == 0
            continue;
        end

        rip = importdataMatTime([dir 'rip.csv']);
        valleys = importdataMatTime([dir 'org.md2k.puffmarker.data.rip.valleys.filtered.csv']);
        if length(valleys) ==0 
            continue; 
        end;
        peaks= importdataMatTime([dir 'org.md2k.puffmarker.data.rip.peaks.filtered.csv']);

        a_y_l = importdataMatTime([dir 'left-wrist-accely.csv']);
        a_y_l_smooth = importdataMatTime([dir 'org.md2k.puffmarker.data.accl.y.mag_800.leftwrist.csv']);
        
        a_y_r = importdataMatTime([dir 'right-wrist-accely.csv']);
        a_y_r_smooth = importdataMatTime([dir 'org.md2k.puffmarker.data.accl.y.mag_800.rightwrist.csv']);

        puffEpi=importdataMatTime([dir 'org.md2k.puffMarker.pufflabel.csv']);
        pLabel=importdataMatTime([dir 'org.md2k.puffMarker.pufflabel.minute.csv']);
        puff = pLabel(find(pLabel(:, 2)==1), 1);
        epiPM=importdataMatTime([dir 'org.md2k.puffMarker.smoking.episode.csv']);

        selfReport=importdataMatTime([dir 'SMOKING_SELFREPORT_CLOUD.csv']);

        if (~isempty(selfReport)) 
            plot_verticalline(selfReport(:, 1), 0, 12, 'k', 'SELF REPORT'); 
            plot_horizontalbox(selfReport(:, 1)-10/(24*60), selfReport(:, 1)+10/(24*60), -2, 8, [1 1 0]);
        end

        PM_cloud=importdataMatTime([dir 'SMOKING_PUFFMARKER_CLOUD.csv']);
        if (~isempty(PM_cloud)) 
            plot_horizontalbox(PM_cloud(:, 1), PM_cloud(:, 1)+5/(24*60), 10, 10.5, [1 0 1]);
            text(rip(1,1), 10.5, 'PuffMarker (Cloud)');
        end
        

        eating_selfreport=importdataMatTime([dir 'EATING_SELFREPORT_CLOUD.csv']);
        if (~isempty(eating_selfreport)) 
            plot_horizontalbox(eating_selfreport(:, 1)-5/(24*60), eating_selfreport(:, 1), 11, 11.5, [1 0 0]);
            text(rip(1,1), 11.5, 'Eating selfreport');
        end
        
        plot_timeseries(rip(:, 1), rip(:, 2)/1000, -2, '-b'); hold on;
        plot_timeseries(peaks(:, 1), peaks(:, 2)/1000, -2, '.r');
        plot_timeseries(valleys(:, 1), valleys(:, 2)/1000, -2, '.g');
        
        plot_timeseries(a_y_l(:, 1), a_y_l(:, 2), 3, '.b');
        plot_timeseries(a_y_l_smooth(:, 1), a_y_l_smooth(:, 2), 3, '.g');        
        plot([a_y_l(1, 1) a_y_l(end, 1)], [3 3], '--');
        
        plot_timeseries(a_y_r(:, 1), a_y_r(:, 2), 7, '.r');
        plot_timeseries(a_y_r_smooth(:, 1), a_y_r_smooth(:, 2), 7, '.g');
        plot([a_y_l(1, 1) a_y_l(end, 1)], [7 7], '--');
        
        if (~isempty(epiPM)) plot_horizontalbox(epiPM(:, 1), epiPM(:, 1)+5/(24*60), 8.5, 9.5, [0.9 0.5 0]); end;
        plot_timeseries(pLabel(:, 1), 9, -0.2, 'og');
        plot_timeseries(puff, 9, -0.2, '*r');
        if (~isempty(epiPM)) plot_timeseries(puffEpi(:, 1), 9, 0.2, '*r'); end;
        text(rip(1,1), 9, 'PuffMarker (Current)');

        title([G.STUDY ' >> PID: ' pid ' SID: ' sid ]);

        set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
        set(gca,'FontSize',16,'fontWeight','bold');
        dynamicDateTicks;

        saveas(gcf,[OUTDIR '\' pid '_' sid '.fig']);
        saveas(gcf,[OUTDIR '\' pid '_' sid '.png']);
        close(gcf);
    end
end
