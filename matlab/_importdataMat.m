function [ M ] = importdataMat( filename, start_timestamp=-1, end_timestamp=-1 )
    G.TIME.TIMEZONE=-6;
    G.TIME.DAYLIGHTSAVING=1;
    G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';

    M = importdata(filename);
    if start_timestamp == -1
        indces = find(M(:,1) > start_timestamp & M(:,1) < end_timestamp );
        M=M(indces, :);
    end
   
    M(:,1) = convert_timestamp_matlabtimestamp(G, M(:, 1));
end

