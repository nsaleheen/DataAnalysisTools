function plot_horizontalline(start_timestamp,end_timestamp, offset,linetype)
    for i=1:length(start_timestamp) 
       plot([start_timestamp(i) end_timestamp(i)], [offset offset], linetype);
       hold on;
    end
end
