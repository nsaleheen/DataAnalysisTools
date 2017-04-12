function [ output_args ] = Plot_features(G, pid, sid, dir )
    G.TIME.TIMEZONE=-6;
    G.TIME.DAYLIGHTSAVING=1;
    G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';
    
    chestMag= importdataMatTime([dir 'org.md2k.activity.data.accl.mag.chest.csv']);
    f= importdataMatTime([dir 'org.md2k.activity.windowed.features.chest.csv']);
    label= importdataMatTime([dir 'org.md2k.activity.windowed.activity.label.chest.csv']);

    gt= importdataMatTime([dir 'labels.csv']);
    gt(:, 2) = convert_timestamp_matlabtimestamp(G, gt(:, 2));
    gt = gt(find(gt(:, 3)>3), :);
    

%     hr= importdataMatTime([dir 'org.md2k.cstress.data.ecg.rr.heartrate.csv']);
  
    indx = find(f(:, 3)>25.5);
    sd = zeros(1, length(f(:, 3)));
    sd(indx)=1;
    
    OUTDIR = G.OUTDIR;
    
    figure;
    hold on;
    
    if ~isempty(gt)
        for i=1:length(gt(:, 1)) 
           rectangle('Position',[gt(i,1),0,gt(i,2)-gt(i,1),1000],'FaceColor',[.9 1 0.1]);
           hold on;
        end
    end
    mnChestMag = min(chestMag(:, 2));
    plot(chestMag(:, 1), (chestMag(:, 2)-mnChestMag), '.c');
    text(chestMag(1, 1), 200, 'Magnatude of chest accel');    
    plot(f(:, 1), (f(:, 2)-mnChestMag), '.r');
    
    plot(f(:, 1), 8*f(:, 3)+2000, '.b'); text(f(1, 1), 1800, 'SD of Mag');  
    plot(f(:, 1), 1200*sd+2000, '-r'); %text(f(1, 1), 8800, 'Activity - SD based (10 sec)');  
    
    plot(f(:, 1), 200*f(:, 4)+4000, '.g'); text(f(1, 1), 4000, 'Entropy of Mag');  
    
    plot(f(:, 1), 500*f(:, 5)+6000, '.k');  text(f(1, 1), 5800, 'Rate of Change');  
    
    
    plot(label(:, 1), 1200*label(:, 2)+9000, '-r'); text(f(1, 1), 8800, 'Activity (10 sec)');  
    
%     plot(hr(:, 1), 10*hr(:, 2)+9000, '.g'); %text(f(1, 1), 8800, 'Activity (10 sec)');  

    
    title([G.STUDY ' >> PID: ' pid ' SID: ' sid ]);

    set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
    set(gca,'FontSize',16,'fontWeight','bold');
    dynamicDateTicks;

%         saveas(gcf,[OUTDIR '\' pid '_' sid '.fig']);
    saveas(gcf,[OUTDIR '\' pid '_' sid '_chestfeatures.jpg']);

%     saveas(gcf,plot_filename,'jpg');
    close(gcf);
end