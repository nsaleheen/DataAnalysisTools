function [ output_args ] = mergeAndSave(dir, subDir, sensor, sIndex, eIndex, prefix, postfix)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    filedir = [dir subDir];

    M=importdata([filedir prefix int2str(sIndex) '_' int2str(sensor) postfix '.csv']);
    for indx=(sIndex+1):1:eIndex
        [filedir prefix int2str(indx) '_' int2str(sensor)  postfix '.csv']
        M=[M; importdata([filedir prefix int2str(indx) '_' int2str(sensor)  postfix '.csv'])];
    end

    dlmwrite([dir subDir '.csv'], M, 'precision', 15);

end

