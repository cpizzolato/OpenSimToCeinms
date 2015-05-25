function [ output_args ] = writeTrial(trialFilename, lmtFile, excitationsFile, momentArmsFileList, externalTorqueFile )
%WRITETRIAL Summary of this function goes here
%   Detailed explanation goes here
%
%momentArmsFileList has to have the following structure
%momentArmsFileList = {};
%momentArmsFileList{1}.dof = 'dof1';
%momentArmsFileList{1}.file = 'file1';
%momentArmsFileList{2}.dof = 'dof2';
%momentArmsFileList{2}.file = 'file2';

inputData = [];
inputData.muscleTendonLengthFile = lmtFile;
inputData.excitationsFile = excitationsFile;
for i =1:length(momentArmsFileList)
    inputData.momentArmsFiles.momentArmsFile{i}.ATTRIBUTE.dofName = momentArmsFileList{i}.dof;
    inputData.momentArmsFiles.momentArmsFile{i}.CONTENT = momentArmsFileList{i}.file;
end
inputData.externalTorquesFile = externalTorqueFile;

pref.CellItem = false;
xml_write(trialFilename, inputData, 'inputData', pref);

output_args = 0;
end

