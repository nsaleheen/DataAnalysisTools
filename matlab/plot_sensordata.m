function [ output_args ] = plot_sensordata( data, factor, offset, indx )
    plot(data(:,1),offset+data(:,indx)/factor);
end
