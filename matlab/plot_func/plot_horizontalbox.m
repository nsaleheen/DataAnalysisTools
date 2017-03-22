function plot_horizontalbox(start_timestamp,end_timestamp, y0, y1,color)
    for i=1:length(start_timestamp) 
       rectangle('Position',[start_timestamp,y0,end_timestamp-start_timestamp,y1-y0],'FaceColor',color);
       hold on;
    end
end
