function plot_signal(timestamp,sample,linetype)
    %hold on;
    ts=timeseries(sample,timestamp);
    ts.TimeInfo.Format='HH:MM:SS';
    ts.TimeInfo.StartDate='01-Jan-1970';
    ts.TimeInfo.Units='milliseconds';
    plot(ts,linetype);
end
