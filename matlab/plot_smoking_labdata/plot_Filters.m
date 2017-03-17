function G=plot_Filters(G, dir, indx, sTime)

    fAccl = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterACCL.csv']);
    fAccl(:, 2) = convert_timestamp_matlabtimestamp(G, fAccl(:, 2));
    fRip = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterRIP.csv']);
    fRip(:, 2) = convert_timestamp_matlabtimestamp(G, fRip(:, 2));
    fDur = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterDUR.csv']);
    fDur(:, 2) = convert_timestamp_matlabtimestamp(G, fDur(:, 2));
    fGH = importdataMatTime([dir 'org.md2k.puffmarker.data.gyr.intersections.rightwrist.filterGYROHEIGHT.csv']);
    fGH(:, 2) = convert_timestamp_matlabtimestamp(G, fGH(:, 2));
   
    for i=1:length(fAccl(:, 1)) 
        plot([fAccl(i, 1) fAccl(i, 2)], [indx indx], 'g');
    end
    text(sTime, indx, 'Filter Accl');
    for i=1:length(fRip(:, 1)) 
        plot([fRip(i, 1) fRip(i, 2)], [indx+0.4 indx+0.4], 'r');
    end
    text(sTime, indx+0.4, 'Filter RIP');
    for i=1:length(fDur(:, 1)) 
        plot([fDur(i, 1) fDur(i, 2)], [indx+0.8 indx+0.8], 'b');
    end
    text(sTime, indx+0.8, 'Filter Dur');
    for i=1:length(fGH(:, 1)) 
        plot([fGH(i, 1) fGH(i, 2)], [indx+1.2 indx+1.2], 'c');
    end    
    
end
