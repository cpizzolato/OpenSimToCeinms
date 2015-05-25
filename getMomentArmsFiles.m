function [ momentArmsData ] = getMomentArmsFiles( baseDir, name )
%GETEMGFILE Summary of this function goes here
%   Detailed explanation goes here
   possibleFiles = dir([baseDir '\*' name '*']);
   momentArmsData = {};
   files = {possibleFiles.name};
   for i = 1:length(files)
       currentFile = files{i};
       ind=strfind(currentFile, name);
       momentArmsData{i}.file = [baseDir '\' files{i}];
       momentArmsData{i}.dof = currentFile(ind+length(name):end-4);
   end
end

