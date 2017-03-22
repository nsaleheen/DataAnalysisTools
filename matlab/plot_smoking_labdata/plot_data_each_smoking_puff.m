function G=plot_data_each_smoking_puff(G)
    G = config_smokinglab(G);

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
            
            truePuffLabel=importdataMatTime([dir 'puffGroundtruth.csv']);
 
            
            if ~isempty(truePuffLabel)
                for i=1:length(truePuffLabel)
                   plot([truePuffLabel(i) truePuffLabel(i)], [-2 10], 'k');
                   text(truePuffLabel(i), 10, 'Puff');
                    if ~isempty(pLabel)
                        plot(pLabel(:, 1), 8, 'og'); hold on;
                        plot(puff, 8, '*r');    
                    end
                    xminLim = truePuffLabel(i)-10/(24*60*60);
                    xmaxLim = truePuffLabel(i)+10/(24*60*60);

                    plot(rip(:,1),-1+rip(:, 2)/1000, 'g'); hold on;
                    plot(valleys(:,1),-1+valleys(:, 2)/1000, '.r');
                    plot(peaks(:,1),-1+peaks(:, 2)/1000, '.b');
                    text(xminLim, 0, 'Respiration');

                    plot(a_y_l(:,1),3+a_y_l(:, 2), 'b'); hold on;
                    plot([a_y_l(1,1) a_y_l(end,1)],[3 3],'k--');

                    plot(a_y_r(:,1),5+a_y_r(:, 2), 'r');
                    plot([a_y_r(1,1) a_y_r(end,1)],[5 5],'k--');
                    text(xminLim, 3, 'A_Y (left)');
                    text(xminLim, 5, 'A_Y (right)');
                    
                    plot_Filters(G, dir, 8.5, xminLim);
                    dynamicDateTicks;
                    dynamicDateTicks;
                    xlim([xminLim, xmaxLim]);
                    title([pid ' _ ' sid ' puff ' num2str(i)]);

                    set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
                    set(gca,'FontSize',16,'fontWeight','bold');
                    
%                     saveas(gcf,[OUTDIR '\' pid '_' sid '_puff_' num2str(i) '.fig']);

                    saveas(gcf,[OUTDIR '\' pid '_' sid '_puff_' num2str(i) '.png']);
                    close(gcf);
                end
            end
        end
    end
end




