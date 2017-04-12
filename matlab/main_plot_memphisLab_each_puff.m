clear all;
G = config();

G = config_smokinglab(G);

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
        candiPeaks= importdataMatTime([dir 'org.md2k.puffmarker.data.candidate.rip.peak.csv']);
        candiValley= importdataMatTime([dir 'org.md2k.puffmarker.data.candidate.rip.valley.csv']);

        gyroMagLeft= importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.mag.leftwrist.csv']);
        gyroMag800Left = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.mag_800.leftwrist.csv']);
        gyroMag8000Left = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.mag_8000.leftwrist.csv']);

        gyroMagRight = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.mag.rightwrist.csv']);
        gyroMag800Right = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.mag_800.rightwrist.csv']);
        gyroMag8000Right = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.mag_8000.rightwrist.csv']);
        
        a_y_l = importdataMatTime([dir 'left-wrist-accely.csv']);
        a_y_l_smooth = importdataMatTime([dir 'org.md2k.puffmarker.data.accl.y.mag_800.leftwrist.csv']);
        
        a_y_r = importdataMatTime([dir 'right-wrist-accely.csv']);
        a_y_r_smooth = importdataMatTime([dir 'org.md2k.puffmarker.data.accl.y.mag_800.rightwrist.csv']);

%         epiPM=importdataMatTime([dir 'org.md2k.puffMarker.smoking.episode.csv']);

        selfReport=importdataMatTime([dir 'puffGroundtruth.csv']);
        if (~isempty(selfReport)) 
            plot_verticalline(selfReport(:, 1), 0, 14, 'k', 'PUFF'); 
%             plot_horizontalbox(selfReport(:, 1)-10/(24*60), selfReport(:, 1)+10/(24*60), -2, 8, [1 1 0]);
        end
        
        plot_timeseries(rip(:, 1), rip(:, 2)/1000, -2, '-b'); hold on;
        plot_timeseries(peaks(:, 1), peaks(:, 2)/1000, -2, '.r');
        plot_timeseries(valleys(:, 1), valleys(:, 2)/1000, -2, '.g');
        plot_timeseries(candiPeaks(:, 1), candiPeaks(:, 2)/1000, -2, 'or');
        plot_timeseries(candiValley(:, 1), candiValley(:, 2)/1000, -2, 'og');

        plot_timeseries(a_y_l(:, 1), a_y_l(:, 2), 3, '.b');
        plot_timeseries(a_y_l_smooth(:, 1), a_y_l_smooth(:, 2), 3, '.g');        
        plot([a_y_l(1, 1) a_y_l(end, 1)], [3 3], '--');

        plot_timeseries(gyroMagLeft(:, 1), gyroMagLeft(:, 2)/250, 5, '.b');
        plot_timeseries(gyroMag800Left(:, 1), gyroMag800Left(:, 2)/250, 5, '.g');        
        plot_timeseries(gyroMag8000Left(:, 1), gyroMag8000Left(:, 2)/250, 5, '.r');        
        plot([gyroMagLeft(1, 1) gyroMagLeft(end, 1)], [5 5], '--k');

        plot_timeseries(a_y_r(:, 1), a_y_r(:, 2), 8, '.r');
        plot_timeseries(a_y_r_smooth(:, 1), a_y_r_smooth(:, 2), 8, '.g');
        plot([a_y_l(1, 1) a_y_l(end, 1)], [8 8], '--');

        plot_timeseries(gyroMagRight(:, 1), gyroMagRight(:, 2)/250, 10, '.b');
        plot_timeseries(gyroMag800Right(:, 1), gyroMag800Right(:, 2)/250, 10, '.g');        
        plot_timeseries(gyroMag8000Right(:, 1), gyroMag8000Right(:, 2)/250, 10, '.r');        
        plot([gyroMagRight(1, 1) gyroMagRight(end, 1)], [10 10], '--k');

%         if (~isempty(epiPM)) plot_horizontalbox(epiPM(:, 1), epiPM(:, 1)+5/(24*60), 8.5, 9.5, [0.9 0.5 0]); end;
%         plot_timeseries(pLabel(:, 1), 9, -0.2, 'og');
%         plot_timeseries(puff, 9, -0.2, '*r');
%         if (~isempty(epiPM)) plot_timeseries(puffEpi(:, 1), 9, 0.2, '*r'); end;
%         text(rip(1,1), 9, 'PuffMarker (Current)');
        
        plot_Filters(G, dir, 12, rip(1, 1), 0);

        title([G.STUDY ' >> PID: ' pid ' SID: ' sid ]);

        set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
        set(gca,'FontSize',16,'fontWeight','bold');
        dynamicDateTicks;

        saveas(gcf,[OUTDIR '\' pid '_' sid '.fig']);
        saveas(gcf,[OUTDIR '\' pid '_' sid '.png']);
        
        if (~isempty(selfReport)) 
            for pCnt = 1:length(selfReport)
                plot_Filters(G, dir, 12, selfReport(pCnt, 1)-5/(24*60*60), 1);
                xlim([selfReport(pCnt, 1)-5/(24*60*60), selfReport(pCnt, 1)+10/(24*60*60)])
                title([G.STUDY ' >> PID: ' pid ' SID: ' sid 'puff: ' num2str(pCnt)]);
               saveas(gcf,[OUTDIR '\' pid '_' sid 'puff' num2str(pCnt) '.png']);
            end
        end                
        
        close(gcf);
    end
end
