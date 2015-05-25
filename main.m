%% input dir
inputDir = uigetdir(' ', 'Select your trials folder');
ind=strfind(inputDir, '\dynamicElaborations');
defaultDir = inputDir(1:ind);
%ikInputDir = uigetdir([defaultDir '\inverseKinematics'], 'Select your IK folder');
maInputDir = uigetdir([defaultDir '\muscleAnalysis'], 'Select your MA folder');
idInputDir = uigetdir([defaultDir '\inverseDynamics'], 'Select your ID folder');

%%outputDir
outDir = [defaultDir '\ceinms\trials'];
if (exist(outDir,'dir') ~= 7)
    mkdir(outDir);
end

%% select only the trials that have been completely processed
trialList = getDirNames(char(inputDir));
%trialList = intersect(trialList,getDirNames(ikInputDir));
trialList = intersect(trialList,getDirNames(maInputDir));
trialList = intersect(trialList,getDirNames(idInputDir));

for trialIdx=1:length(trialList)
   currentTrial = char(trialList(trialIdx));
   emgDir = [inputDir '\' currentTrial];
   emgFile = getFile(emgDir, 'emg');
   lmtMaDir = [maInputDir '\' currentTrial];
   lmtFile = getFile(lmtMaDir, '_Length');
   extTorqueDir = [idInputDir '\' currentTrial];
   extTorqueFile = getFile(extTorqueDir, 'inverse_dynamics');  
   maData = getMomentArmsFiles(lmtMaDir, '_MomentArm_');
   trialFilename = [outDir '\' currentTrial '.xml'];
   writeTrial(trialFilename, lmtFile, emgFile, maData, extTorqueFile );
end
