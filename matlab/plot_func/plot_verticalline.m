function plot_verticalline(timestamp,y0, y1,linetype, txt)
    for i=1:length(timestamp) 
       plot([timestamp(i) timestamp(i)], [y0 y1], linetype);
       text(selfReport(i,1), y1, txt);
       hold on;
    end
end
