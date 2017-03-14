function [ M ] = importdataSE( filename, start_timestamp, end_timestamp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    M = importdata(filename);
    if start_timestamp >= 0 && end_timestamp >=0
        indces = find(M(:,1) > start_timestamp & M(:,1) < end_timestamp );
        M=M(indces, :);
    end
end

