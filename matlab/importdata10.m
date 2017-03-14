function [ M ] = importdata10( filename, start_timestamp, end_timestamp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    M = importdata(filename);
%     indces = find(M(:,1) > start_timestamp & M(:,1) < end_timestamp );
%     M=M(indces, :);
%     endLen = fix(length(M(:,1))*0.4);
% 
%     M = M(1:endLen, :);

end

