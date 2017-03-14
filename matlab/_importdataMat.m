function [ M ] = importdataMat( filename, start_timestamp, end_timestamp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    G.TIME.TIMEZONE=-6;
    G.TIME.DAYLIGHTSAVING=1;
    G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';

    M = importdata(filename);
    if isempty(start_timestamp)
        indces = find(M(:,1) > start_timestamp & M(:,1) < end_timestamp );
        M=M(indces, :);
    end
   
    M(:,1) = convert_timestamp_matlabtimestamp(G, M(:, 1));
end

