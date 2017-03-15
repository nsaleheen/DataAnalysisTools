function [ M ] = importdataMatTime( filename)
    G.TIME.TIMEZONE=-6;
    G.TIME.DAYLIGHTSAVING=1;
    G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';
    
    if ~exist(filename, 'file')
        M=[];
        return;
    end
    M = importdata(filename);
%     if exists('arg2','start_timestamp')
%         indces = find(M(:,1) >= start_timestamp & M(:,1) <= end_timestamp );
%         M=M(indces, :);
%     end
   if length(M)>0
        M(:,1) = convert_timestamp_matlabtimestamp(G, M(:, 1));
   end
end

