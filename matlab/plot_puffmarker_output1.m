clear all;

dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p03\s03\';
a_y_l = importdata([dir 'left-wrist-accely.csv']);
a_y_r = importdata([dir 'right-wrist-accely.csv']);

fv=importdata([dir 'org.md2k.puffMarker.fv.minute.csv']);
pLabel=importdata([dir 'org.md2k.puffMarker.pufflabel.minute.csv']);
puff = pLabel(find(pLabel(:, 2)==1), 1);
epi=importdata([dir 'org.md2k.puffMarker.smoking.episode.csv']);

fvW=importdata([dir 'org.md2k.puffMarker.wrist.fv.minute.csv']);
% epiW=importdata([dir 'org.md2k.puffMarker.wrist.smoking.episode.csv']);
pLabelW=importdata([dir 'org.md2k.puffMarker.wrist.pufflabel.minute.csv']);
puffW = pLabelW(find(pLabelW(:, 2)==1), 1);
gt=importdata([dir 'puffGroundtruth.csv']);

figure;
epi_S_E=importdata([dir 'episode_start_end.csv']);
if length(epi_S_E)>0
    for i=1:length(epi_S_E(:, 1)) 
       rectangle('Position',[epi_S_E(i,1),0,(epi_S_E(i,2)-epi_S_E(i,1)),4.5],'FaceColor',[.9 1 0.1]);
    %    plot([epi_S_E(i,1) epi_S_E(i,2)],[0 4.5]);
       hold on;
    end
end
if length(epi)>0
    for i=1:length(epi(:, 1)) 
       rectangle('Position',[epi(i,1),4.5,300000,1],'FaceColor',[.9 0 0.1]);
       hold on;
    end
end

if length(gt)>0
    for i=1:length(gt) 
       plot([gt(i,1) gt(i,1)],[0 5]);
       hold on;
    end
end

plot(a_y_l(:,1),a_y_l(:, 2), 'b'); hold on;
plot(a_y_r(:,1),a_y_r(:, 2), 'r');
plot([a_y_r(1,1) a_y_r(end,1)],[0 0],'k--')

if length(fv)>0
    plot(fv(:, 1), 3, 'og');
    plot(puff, 3, '*r');    
end
if length(fvW)>0
    plot(fvW(:, 1), 4, 'og');
    plot(puff, 4, '*r');    
end
% if length(epi)>0
%         for i=1:length(epi) 
%            plot([epi(i,1) epi(i,2)],[-2.5 -2.5]);
%            hold on;
%         end
% end



